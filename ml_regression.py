# -*- coding: utf-8 -*-
"""
Script d'entraînement de modèles de classification multi-classe pour prédire
la direction future du marché.

Changement de paradigme :
- Cible : [0: DOWN, 1: SIDEWAYS, 2: UP] basé sur le mouvement futur du prix.
- Modèles : LGBMClassifier, XGBClassifier en mode multiclass.
- Objectif d'optimisation : Maximiser l'accuracy ou le F1-score pondéré.
- Décision de trading : Basée sur la classe prédite (ex: UP -> Achat).
"""
import os
import json
import numpy as np
import pandas as pd
from dataclasses import dataclass
from typing import Dict, Any

# Métriques de classification et outils de ML
from sklearn.metrics import accuracy_score, f1_score, confusion_matrix
from sklearn.model_selection import TimeSeriesSplit
import warnings

# Essai d'import des bibliothèques de boosting et d'optimisation
try:
    import optuna
    import joblib
    import lightgbm as lgb

    HAS_LGB = True
except ImportError:
    HAS_LGB = False

try:
    from xgboost import XGBClassifier

    HAS_XGB = True
except ImportError:
    HAS_XGB = False

# Ignorer les avertissements non critiques
warnings.filterwarnings("ignore", category=FutureWarning, module="pandas")
warnings.filterwarnings("ignore", category=UserWarning, module="sklearn")

# =============================================================================
# 1. PARAMÈTRES GLOBAUX
# =============================================================================
FILE_PATH = "/home/emmanuel-raoul/newòn py/Antrènman_tès/XAUUSD_21_22.csv"
OUTPUT_DIR = "Antrènan_Bot_Multiclass"
RANDOM_STATE = 42
N_SPLITS = 5  # Nombre de plis pour la validation croisée

# Paramètres pour la création de la cible
LOOKAHEAD_PERIODS = 12  # Nombre de bougies à regarder dans le futur (ex: 12 heures)
MOVEMENT_THRESHOLD_ATR = 1.5  # Seuil en multiple de l'ATR pour définir un mouvement UP/DOWN

os.makedirs(OUTPUT_DIR, exist_ok=True)

# =============================================================================
# 2. CHARGEMENT ET INGÉNIERIE DES FEATURES
# =============================================================================
print("\n--- Phase de Préparation des Données ---")

required_columns = ['ticket', 'type', 'result', 'rsiV', 'atrV',
                    'tenkan', 'kijun', 'spanA', 'spanB', 'lagging', 'ADX_14',
                    'timeInput', 'timeOutput', 'price', 'sl', 'tp']

print(f"Chargement du fichier : {FILE_PATH}")
df = pd.read_csv(FILE_PATH, sep=';', encoding='utf-8-sig')
df.columns = df.columns.str.strip()

# --- Feature Engineering (identique aux scripts précédents) ---
print("Création des features...")
df['risk_reward_ratio'] = (df['tp'] - df['price']).abs() / (df['price'] - df['sl']).abs().replace(0, np.nan)
df['cloud_thickness'] = (df['spanA'] - df['spanB']).abs()
df['tk_cross_signal'] = np.sign(df['tenkan'] - df['kijun'])
df['tenkan_slope'] = df['tenkan'].diff(3)
df['kijun_slope'] = df['kijun'].diff(3)
df['atr_relative'] = df['atrV'] / df['atrV'].rolling(50, min_periods=1).mean()
df['price_vs_kijun'] = (df['price'] - df['kijun']) / df['atrV']
df['rsi_stability'] = df['rsiV'].rolling(14).std()
df['adx_trend_strength'] = pd.cut(df['ADX_14'], bins=[0, 20, 25, 100], labels=[0, 1, 2], right=False).astype(int)
df['hour_of_day'] = pd.to_datetime(df['timeInput']).dt.hour

# On ne garde que les entrées de trade
df = df.sort_values('timeInput').reset_index(drop=True)
df_entries = df.groupby('ticket', as_index=False).head(1).reset_index(drop=True)

# =============================================================================
# 3. CRÉATION DE LA CIBLE MULTI-CLASSE
# =============================================================================
print(f"Création de la cible multi-classe avec une fenêtre de {LOOKAHEAD_PERIODS} périodes...")


def create_multiclass_target(df_full, df_entries, lookahead, atr_multiplier):
    target = []
    for idx, row in df_entries.iterrows():
        entry_time = row['timeInput']
        entry_price = row['price']
        current_atr = row['atrV']

        # Définir la fenêtre future dans le dataframe complet
        future_df = df_full[df_full['timeInput'] > entry_time].head(lookahead)

        if len(future_df) < lookahead:
            target.append(np.nan)  # Pas assez de données futures
            continue

        high_future = future_df['price'].max()
        low_future = future_df['price'].min()

        upper_barrier = entry_price + (current_atr * atr_multiplier)
        lower_barrier = entry_price - (current_atr * atr_multiplier)

        # Logique de classification
        if high_future >= upper_barrier and low_future > lower_barrier:
            target.append(2)  # UP
        elif low_future <= lower_barrier and high_future < upper_barrier:
            target.append(0)  # DOWN
        else:
            target.append(1)  # SIDEWAYS (ou les deux barrières sont touchées)

    return pd.Series(target, index=df_entries.index)


df_entries['target'] = create_multiclass_target(df, df_entries, LOOKAHEAD_PERIODS, MOVEMENT_THRESHOLD_ATR)

# Nettoyage final après création de la cible
df_final = df_entries.dropna(subset=['target']).copy()
df_final['target'] = df_final['target'].astype(int)

print("\nDistribution des classes :")
print(df_final['target'].value_counts(normalize=True))

FEATURES = ['type', 'rsiV', 'atrV', 'risk_reward_ratio', 'ADX_14', 'cloud_thickness',
            'tk_cross_signal', 'tenkan_slope', 'kijun_slope', 'atr_relative',
            'price_vs_kijun', 'rsi_stability', 'adx_trend_strength', 'hour_of_day']

df_final.replace([np.inf, -np.inf], np.nan, inplace=True)
df_final[FEATURES] = df_final[FEATURES].ffill().fillna(0)

X = df_final[FEATURES].astype(np.float32).values
y = df_final['target'].values

print(f"Préparation terminée. {len(df_final)} trades prêts pour l'entraînement.")


# =============================================================================
# 4. FONCTIONS UTILITAIRES ET D'ÉVALUATION
# =============================================================================
@dataclass
class EvalResult:
    name: str
    metrics_test: Dict[str, float]
    conf_matrix_test: Any


def evaluate_multiclass(y_true, y_pred) -> Dict[str, float]:
    return {
        "accuracy": accuracy_score(y_true, y_pred),
        "f1_weighted": f1_score(y_true, y_pred, average='weighted', zero_division=0),
    }


# =============================================================================
# 5. FONCTIONS D'OPTIMISATION (OPTUNA)
# =============================================================================
def optimize_classifier(model_type: str, X_train, y_train, X_val, y_val) -> Dict:
    """Optimise un classifieur (LGBM ou XGB) pour un problème multi-classe."""

    def objective(trial: optuna.trial.Trial) -> float:
        if model_type == 'lgbm':
            params = {
                'objective': 'multiclass', 'metric': 'multi_logloss', 'verbosity': -1,
                'num_class': 3, 'seed': RANDOM_STATE, 'n_estimators': 1000,
                'learning_rate': trial.suggest_float('learning_rate', 0.01, 0.1, log=True),
                'num_leaves': trial.suggest_int('num_leaves', 10, 50),
                'max_depth': trial.suggest_int('max_depth', 3, 8),
            }
            model = lgb.LGBMClassifier(**params)
            model.fit(X_train, y_train, eval_set=[(X_val, y_val)], callbacks=[lgb.early_stopping(100, verbose=False)])
        else:  # xgb
            params = {
                'objective': 'multi:softmax', 'eval_metric': 'mlogloss', 'num_class': 3,
                'tree_method': 'hist', 'n_jobs': -1, 'random_state': RANDOM_STATE,
                'learning_rate': trial.suggest_float('learning_rate', 0.01, 0.1, log=True),
                'max_depth': trial.suggest_int('max_depth', 3, 8),
                'subsample': trial.suggest_float('subsample', 0.6, 1.0),
                'colsample_bytree': trial.suggest_float('colsample_bytree', 0.6, 1.0),
            }
            model = XGBClassifier(n_estimators=1000, early_stopping_rounds=100, **params)
            model.fit(X_train, y_train, eval_set=[(X_val, y_val)], verbose=False)

        preds_val = model.predict(X_val)
        return f1_score(y_val, preds_val, average='weighted', zero_division=0)

    print(f"\n[{model_type.upper()}] Lancement de l'optimisation (maximisation F1-score pondéré)...")
    study = optuna.create_study(direction="maximize")
    study.optimize(objective, n_trials=50)
    print(f"[{model_type.upper()}] Meilleurs paramètres trouvés: {study.best_params}")
    return study.best_params


# =============================================================================
# 6. WORKFLOW D'ENTRAÎNEMENT PRINCIPAL
# =============================================================================
# --- PHASE 1: OPTIMISATION ---
print("\n" + "=" * 20 + " PHASE 1: OPTIMISATION DES HYPERPARAMÈTRES " + "=" * 20)
# ... (la logique d'optimisation reste la même)
first_fold_tscv = TimeSeriesSplit(n_splits=N_SPLITS)
train_val_idx_optim, _ = next(iter(first_fold_tscv.split(X)))
X_train_val_optim, y_train_val_optim = X[train_val_idx_optim], y[train_val_idx_optim]
val_size_optim = int(len(X_train_val_optim) * 0.25)
train_size_optim = len(X_train_val_optim) - val_size_optim
X_train_optim, y_train_optim = X_train_val_optim[:train_size_optim], y_train_val_optim[:train_size_optim]
X_val_optim, y_val_optim = X_train_val_optim[train_size_optim:], y_train_val_optim[train_size_optim:]

best_lgbm_params = optimize_classifier('lgbm', X_train_optim, y_train_optim, X_val_optim,
                                       y_val_optim) if HAS_LGB else {}
best_xgb_params = optimize_classifier('xgb', X_train_optim, y_train_optim, X_val_optim, y_val_optim) if HAS_XGB else {}

# --- PHASE 2: VALIDATION CROISÉE ---
print("\n" + "=" * 20 + " PHASE 2: VALIDATION CROISÉE " + "=" * 20)
tscv = TimeSeriesSplit(n_splits=N_SPLITS)
all_results = []

for fold, (train_val_index, test_index) in enumerate(tscv.split(X)):
    print(f"\n--- FOLD {fold + 1}/{N_SPLITS} ---")
    # ... (la logique de split reste la même)
    X_train_val, y_train_val = X[train_val_index], y[train_val_index]
    X_test, y_test = X[test_index], y[test_index]
    val_size = int(len(X_train_val) * 0.20)
    train_size = len(X_train_val) - val_size
    X_train, y_train = X_train_val[:train_size], y_train_val[:train_size]
    X_val, y_val = X_train_val[train_size:], y_train_val[train_size:]

    # Entraînement et évaluation de LightGBM
    if HAS_LGB:
        try:
            print("\n[LGBM Classifier] Entraînement...")
            lgbm_params = best_lgbm_params.copy()
            lgbm_params.update({'objective': 'multiclass', 'num_class': 3, 'metric': 'multi_logloss', 'verbosity': -1,
                                'seed': RANDOM_STATE, 'n_estimators': 5000})
            model_lgb = lgb.LGBMClassifier(**lgbm_params)
            model_lgb.fit(X_train, y_train, eval_set=[(X_val, y_val)],
                          callbacks=[lgb.early_stopping(200, verbose=False)])
            y_pred_lgb = model_lgb.predict(X_test)
            metrics_lgb = evaluate_multiclass(y_test, y_pred_lgb)
            cm_lgb = confusion_matrix(y_test, y_pred_lgb, labels=[0, 1, 2])
            print("[LGBM Classifier] Métriques Test:", {k: round(v, 4) for k, v in metrics_lgb.items()})
            all_results.append(EvalResult(name="LGBM Classifier", metrics_test=metrics_lgb, conf_matrix_test=cm_lgb))
        except Exception as e:
            print(f"[LGBM Classifier] a échoué: {e}")

    # Entraînement et évaluation de XGBoost
    if HAS_XGB:
        try:
            print("\n[XGBoost Classifier] Entraînement...")
            xgb_params = best_xgb_params.copy()
            xgb_params.update(
                {'objective': 'multi:softmax', 'num_class': 3, 'eval_metric': 'mlogloss', 'tree_method': 'hist',
                 'n_jobs': -1, 'random_state': RANDOM_STATE})
            model_xgb = XGBClassifier(n_estimators=5000, early_stopping_rounds=200, **xgb_params)
            model_xgb.fit(X_train, y_train, eval_set=[(X_val, y_val)], verbose=False)
            y_pred_xgb = model_xgb.predict(X_test)
            metrics_xgb = evaluate_multiclass(y_test, y_pred_xgb)
            cm_xgb = confusion_matrix(y_test, y_pred_xgb, labels=[0, 1, 2])
            print("[XGBoost Classifier] Métriques Test:", {k: round(v, 4) for k, v in metrics_xgb.items()})
            all_results.append(EvalResult(name="XGBoost Classifier", metrics_test=metrics_xgb, conf_matrix_test=cm_xgb))
        except Exception as e:
            print(f"[XGBoost Classifier] a échoué: {e}")

# --- Agrégation et Sélection du Meilleur Modèle ---
print(f"\n{'=' * 20} RÉSULTATS GLOBAUX (moyenne sur {N_SPLITS} plis) {'=' * 20}")
# ... (la logique d'agrégation reste similaire, mais on somme les matrices de confusion)
final_summary = {}
for res in all_results:
    if res.name not in final_summary:
        final_summary[res.name] = {'metrics': [], 'conf_matrix': np.zeros((3, 3), dtype=int)}
    final_summary[res.name]['metrics'].append(res.metrics_test)
    final_summary[res.name]['conf_matrix'] += res.conf_matrix_test

aggregated_results = []
for name, data in final_summary.items():
    df_metrics = pd.DataFrame(data['metrics'])
    mean_metrics = df_metrics.mean().to_dict()
    print(f"\n--- {name} ---")
    print(df_metrics.round(4))
    print("\nMoyenne:")
    print(pd.Series(mean_metrics).round(4))
    aggregated_results.append(EvalResult(name=name, metrics_test=mean_metrics, conf_matrix_test=data['conf_matrix']))


def selection_score(res: EvalResult) -> float:
    return res.metrics_test.get("f1_weighted", 0)


print("\nSélection du meilleur modèle basée sur le F1-score pondéré...")
aggregated_results_sorted = sorted(aggregated_results, key=selection_score, reverse=True)
best = aggregated_results_sorted[0]

# --- Résumé Final ---
print("\n========================")
print("Meilleur modèle:", best.name)
print("\nPerformance moyenne sur les plis de test:")
for k, v in best.metrics_test.items():
    print(f" - {k:<20}: {v:.4f}")
print("\nMatrice de confusion totale (Somme sur tous les plis):")
print("Légende: 0:DOWN, 1:SIDEWAYS, 2:UP")
print(best.conf_matrix_test)
print("========================\n")

print("Fini.")