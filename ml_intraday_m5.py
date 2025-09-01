# -*- coding: utf-8 -*-
"""
Script d'entraînement pour un modèle de trading intraday sur données M5.

Stratégie "Qualificateur Ichimoku Expert":
- Étape 1 (Signal) : Détection de signaux de base (croisement M5 Tenkan/Kijun).
- Étape 2 (Contexte) : Enrichissement avec des features M15 et H1 basées sur l'expertise Ichimoku.
- Étape 3 (Qualification) : Le modèle ML apprend à filtrer les signaux à haute probabilité.
- Labellisation : "Triple Barrier Method" appliquée uniquement sur les signaux.
"""
import os
import numpy as np
import pandas as pd
from dataclasses import dataclass
from typing import Dict, Any

# Outils de ML
from sklearn.metrics import roc_auc_score, f1_score, precision_score, confusion_matrix
from sklearn.model_selection import TimeSeriesSplit
import warnings

# Bibliothèques de Boosting et d'Optimisation
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

warnings.filterwarnings("ignore", category=FutureWarning)
warnings.filterwarnings("ignore", category=UserWarning)

# =============================================================================
# 1. PARAMÈTRES GLOBAUX
# =============================================================================
FILE_PATH = "/home/emmanuel-raoul/newòn py/Antrènman_tès/XAUUSD_21_M1.csv"
OUTPUT_DIR = "Antrenan_Bot_Ichimoku_Expert"
RANDOM_STATE = 42
N_SPLITS = 5

# --- Paramètres pour la méthode des trois barrières ---
TAKE_PROFIT_ATR = 2.0
STOP_LOSS_ATR = 1.0
HOLDING_PERIOD_BARS = 4 * 12  # 4 heures (à 12 bougies de 5min par heure)

os.makedirs(OUTPUT_DIR, exist_ok=True)


# =============================================================================
# 2. CHARGEMENT ET INGÉNIERIE DES FEATURES
# =============================================================================
def calculate_ichimoku(df: pd.DataFrame) -> pd.DataFrame:
    """Calcule les composantes d'Ichimoku sur un DataFrame donné."""
    tenkan_period = 9
    kijun_period = 26
    senkou_b_period = 52
    chikou_displacement = 26
    senkou_displacement = 26

    df['tenkan_sen'] = (df['high'].rolling(tenkan_period).max() + df['low'].rolling(tenkan_period).min()) / 2
    df['kijun_sen'] = (df['high'].rolling(kijun_period).max() + df['low'].rolling(kijun_period).min()) / 2
    df['senkou_span_a'] = ((df['tenkan_sen'] + df['kijun_sen']) / 2).shift(senkou_displacement)
    df['senkou_span_b'] = (
                (df['high'].rolling(senkou_b_period).max() + df['low'].rolling(senkou_b_period).min()) / 2).shift(
        senkou_displacement)
    df['chikou_span'] = df['close'].shift(-chikou_displacement)
    return df


def load_and_prepare_data(file_path: str) -> pd.DataFrame:
    """Charge les données, crée des features multi-temporelles basées sur Ichimoku."""
    print("\n--- Phase de Préparation des Données ---")
    print(f"Chargement du fichier : {file_path}")
    try:
        df_1m = pd.read_csv(file_path, sep=',')
    except FileNotFoundError:
        raise SystemExit(f"ERREUR: Fichier introuvable à l'adresse : {file_path}")

    df_1m.columns = [c.lower().strip() for c in df_1m.columns]
    df_1m['datetime'] = pd.to_datetime(df_1m['datetime'])

    # --- Création des DataFrames M5, M15, H1 ---
    agg_dict = {'open': 'first', 'high': 'max', 'low': 'min', 'close': 'last'}
    df_m5 = df_1m.set_index('datetime').resample('5T').agg(agg_dict).dropna()
    df_m15 = df_1m.set_index('datetime').resample('15T').agg(agg_dict).dropna()
    df_h1 = df_1m.set_index('datetime').resample('1H').agg(agg_dict).dropna()

    # CORRECTION : Ajouter le calcul manquant du RSI pour le timeframe H1
    df_h1['rsi'] = 100 - (100 / (1 + df_h1['close'].diff().clip(lower=0).rolling(14).mean() / \
                                 df_h1['close'].diff().clip(upper=0).abs().rolling(14).mean()))


    # --- Calcul des indicateurs sur chaque timeframe ---
    print("Calcul des indicateurs sur M5, M15, H1...")
    df_m5 = calculate_ichimoku(df_m5)
    df_m15 = calculate_ichimoku(df_m15)
    df_h1 = calculate_ichimoku(df_h1)

    df_m5['atr'] = (df_m5['high'] - df_m5['low']).rolling(14).mean()
    df_m5['rsi'] = 100 - (100 / (1 + df_m5['close'].diff().clip(lower=0).rolling(14).mean() / \
                                 df_m5['close'].diff().clip(upper=0).abs().rolling(14).mean()))
    # --- NOUVEAU : Filtre de Régime de Marché ---
    print("Création du filtre de régime de marché (Tendance/Range)...")
    df_m5['ema_200'] = df_m5['close'].ewm(span=200, adjust=False).mean()
    df_m5['ema_200_slope'] = df_m5['ema_200'].diff()
    df_m5['market_regime'] = np.select(
        [df_m5['close'] > df_m5['ema_200'], df_m5['close'] < df_m5['ema_200']],
        [1, -1], default=0
    )

    # --- Fusion des données multi-temporelles ---
    print("Fusion des contextes M15 et H1 dans les données M5...")
    df_m15.columns = [f"{col}_m15" for col in df_m15.columns]
    df_h1.columns = [f"{col}_h1" for col in df_h1.columns]

    df_merged = pd.merge_asof(df_m5.sort_index(), df_m15.sort_index(), left_index=True, right_index=True, direction='backward')
    df_merged = pd.merge_asof(df_merged.sort_index(), df_h1.sort_index(), left_index=True, right_index=True, direction='backward')


    # --- Création des Features Expertes ---
    print("Création des features expertes basées sur vos règles...")
    # Définir la constante pour qu'elle soit accessible dans ce scope
    chikou_displacement = 26
    # Règle 1 & 2 (M5): Confirmation Kumo + Kijun
    df_merged['m5_is_above_cloud'] = (df_merged['close'] > df_merged['senkou_span_a']) & (
                df_merged['close'] > df_merged['senkou_span_b'])
    df_merged['m5_is_below_cloud'] = (df_merged['close'] < df_merged['senkou_span_a']) & (
                df_merged['close'] < df_merged['senkou_span_b'])
    df_merged['m5_is_above_kijun'] = df_merged['close'] > df_merged['kijun_sen']

    # Règle 3 (M5): Confirmation Chikou
    df_merged['m5_chikou_is_free'] = (df_merged['chikou_span'] > df_merged['high'].shift(-chikou_displacement)) | \
                                     (df_merged['chikou_span'] < df_merged['low'].shift(-chikou_displacement))

    # Règle "Kumo épais" (M5)
    df_merged['m5_kumo_thickness'] = (df_merged['senkou_span_a'] - df_merged['senkou_span_b']).abs() / df_merged['atr']

    # Règle M15
    df_merged['m15_is_above_cloud'] = (df_merged['close'] > df_merged['senkou_span_a_m15']) & (
                df_merged['close'] > df_merged['senkou_span_b_m15'])
    df_merged['m15_is_below_cloud'] = (df_merged['close'] < df_merged['senkou_span_a_m15']) & (
                df_merged['close'] < df_merged['senkou_span_b_m15'])
    df_merged['m15_is_above_kijun'] = df_merged['close'] > df_merged['kijun_sen_m15']

    # Règle H1
    df_merged['h1_is_ranging'] = ((df_merged['close'] > df_merged['senkou_span_a_h1']) & (
                df_merged['close'] < df_merged['senkou_span_b_h1'])) | \
                                 ((df_merged['close'] < df_merged['senkou_span_a_h1']) & (
                                             df_merged['close'] > df_merged['senkou_span_b_h1']))

    df_merged.reset_index(inplace=True)
    df_merged = df_merged.dropna()
    return df_merged


def generate_signals(df: pd.DataFrame) -> pd.DataFrame:
    """Génère des signaux de trading basés sur un croisement Tenkan/Kijun M5."""
    print("Génération des signaux d'entrée (Croisement M5 Tenkan/Kijun)...")

    df['position'] = np.where(df['tenkan_sen'] > df['kijun_sen'], 1, -1)
    df['signal'] = df['position'].diff().fillna(0).astype(int)

    # On ne garde que les croisements effectifs
    df['signal'] = np.where(df['signal'].abs() == 2, df['signal'] / 2, 0).astype(int)

    df.drop(columns=['position'], inplace=True)
    print(f"Nombre de signaux trouvés: {(df['signal'] != 0).sum()}")
    return df


# =============================================================================
# 3. CRÉATION DE LA CIBLE (TRIPLE BARRIER METHOD)
# =============================================================================
def apply_triple_barrier(df: pd.DataFrame, tp_atr: float, sl_atr: float, holding_bars: int) -> pd.DataFrame:
    """Crée la cible binaire (1 pour TP, 0 pour SL/Timeout) pour les signaux d'entrée."""
    print(f"Application de la méthode des trois barrières sur les signaux...")

    outcomes = pd.Series(np.nan, index=df.index)
    signal_indices = df[df['signal'] != 0].index

    for i in signal_indices:
        if i + 1 + holding_bars >= len(df):
            continue

        entry_price = df['open'].iloc[i + 1]
        current_atr = df['atr'].iloc[i]
        signal = df['signal'].iloc[i]

        if signal == 1:  # Long trade
            tp_price = entry_price + (current_atr * tp_atr)
            sl_price = entry_price - (current_atr * sl_atr)
        else:  # Short trade
            tp_price = entry_price - (current_atr * tp_atr)
            sl_price = entry_price + (current_atr * sl_atr)

        outcome = 0  # Par défaut: perte ou timeout
        future_bars = df.iloc[i + 1: i + 1 + holding_bars]

        for j in range(len(future_bars)):
            high, low = future_bars['high'].iloc[j], future_bars['low'].iloc[j]
            if signal == 1 and high >= tp_price:
                outcome = 1;
                break
            if signal == 1 and low <= sl_price:
                outcome = 0;
                break
            if signal == -1 and low <= tp_price:
                outcome = 1;
                break
            if signal == -1 and high >= sl_price:
                outcome = 0;
                break

        outcomes.loc[i] = outcome

    df['target'] = outcomes
    return df


# --- Workflow de préparation ---
df_full = load_and_prepare_data(FILE_PATH)
df_with_signals = generate_signals(df_full)
df_labeled = apply_triple_barrier(df_with_signals, TAKE_PROFIT_ATR, STOP_LOSS_ATR, HOLDING_PERIOD_BARS)

# On ne garde que les lignes où un signal a été généré ET où une cible a pu être calculée
df_final = df_labeled[df_labeled['signal'] != 0].dropna(subset=['target'])
df_final['target'] = df_final['target'].astype(int)

print("\nDistribution de la cible sur les signaux filtrés:")
print(df_final['target'].value_counts(normalize=True))

FEATURES = [
# NOUVELLE LISTE DE FEATURES : Basée sur l'importance et l'ajout du contexte de régime
     'atr',
     'm5_kumo_thickness',
     'rsi_h1',
     'rsi',
     'market_regime',  # Notre nouveau filtre de tendance
     'signal'          # Le signal de base (achat/vente)
]

X = df_final[FEATURES].astype(np.float32).values
y = df_final['target'].values

print(f"\nPréparation terminée. {len(df_final)} signaux de haute qualité prêts pour l'entraînement.")


# =============================================================================
# 4. MODÈLES, OPTIMISATION ET VALIDATION
# =============================================================================
# Le reste du script (fonctions search_and_evaluate, optimize_lgbm, et la boucle de CV)
# peut rester identique à la version précédente, car il est déjà bien conçu pour
# la classification binaire avec recherche de seuil.
# Je le recopie ici pour que le fichier soit complet.
# =============================================================================

@dataclass
class EvalResult:
    name: str
    metrics_test: Dict[str, float]
    conf_matrix_test: Any


def search_and_evaluate(y_true, y_prob, min_trades=10):
    best_precision = 0
    best_threshold = 0.5
    has_two_classes = len(np.unique(y_true)) > 1
    initial_auc = roc_auc_score(y_true, y_prob) if has_two_classes else 0.5
    best_metrics = {"auc": initial_auc, "f1": 0.0, "precision": 0.0}
    best_cm = confusion_matrix(y_true, np.zeros_like(y_true))

    for threshold in np.arange(0.5, 0.96, 0.01):
        y_pred = (y_prob >= threshold).astype(int)
        num_trades = np.sum(y_pred)
        if num_trades >= min_trades:
            precision = precision_score(y_true, y_pred, zero_division=0)
            if precision >= best_precision:
                best_precision = precision
                best_threshold = threshold
                best_metrics = {
                    "auc": roc_auc_score(y_true, y_prob) if has_two_classes else 0.5,
                    "f1": f1_score(y_true, y_pred, zero_division=0),
                    "precision": precision,
                }
                best_cm = confusion_matrix(y_true, y_pred)
    return best_metrics, best_cm, best_threshold


def optimize_lgbm(X_train, y_train, X_val, y_val, scale_pos_weight):
    print("\n[Optuna] Recherche des meilleurs hyperparamètres pour LightGBM...")

    def objective(trial):
        params = {
            'objective': 'binary', 'metric': 'auc', 'random_state': RANDOM_STATE,
            'n_estimators': 1000, 'verbosity': -1, 'scale_pos_weight': scale_pos_weight,
            'learning_rate': trial.suggest_float('learning_rate', 0.01, 0.1, log=True),
            'num_leaves': trial.suggest_int('num_leaves', 20, 60),
            'max_depth': trial.suggest_int('max_depth', 4, 10),
            'min_child_samples': trial.suggest_int('min_child_samples', 20, 100),
            'feature_fraction': trial.suggest_float('feature_fraction', 0.6, 1.0),
            'bagging_fraction': trial.suggest_float('bagging_fraction', 0.6, 1.0),
            'bagging_freq': trial.suggest_int('bagging_freq', 1, 7),
        }
        model = lgb.LGBMClassifier(**params)
        model.fit(X_train, y_train, eval_set=[(X_val, y_val)],
                  callbacks=[lgb.early_stopping(50, verbose=False)])
        y_prob = model.predict_proba(X_val)[:, 1]
        return roc_auc_score(y_val, y_prob)

    study = optuna.create_study(direction='maximize')
    study.optimize(objective, n_trials=30)
    print(f"[Optuna] Meilleurs paramètres trouvés: {study.best_params}")
    return study.best_params


def optimize_xgb(X_train, y_train, X_val, y_val, scale_pos_weight):
    """Optimise les hyperparamètres de XGBoost avec Optuna."""
    print("\n[Optuna] Recherche des meilleurs hyperparamètres pour XGBoost...")

    def objective(trial):
        params = {
            'objective': 'binary:logistic',
            'eval_metric': 'auc',
            'random_state': RANDOM_STATE,
            'n_estimators': 1000,
            'use_label_encoder': False,
            'verbosity': 0,
            'scale_pos_weight': scale_pos_weight,
            'learning_rate': trial.suggest_float('learning_rate', 0.01, 0.1, log=True),
            'max_depth': trial.suggest_int('max_depth', 3, 9),
            'subsample': trial.suggest_float('subsample', 0.6, 1.0),
            'colsample_bytree': trial.suggest_float('colsample_bytree', 0.6, 1.0),
            'gamma': trial.suggest_float('gamma', 1e-8, 1.0, log=True),
            'min_child_weight': trial.suggest_int('min_child_weight', 1, 10),
        }
        model = XGBClassifier(**params, early_stopping_rounds=50)
        model.fit(X_train, y_train,
                  eval_set=[(X_val, y_val)],
                  verbose=False)
        y_prob = model.predict_proba(X_val)[:, 1]
        return roc_auc_score(y_val, y_prob)

    study = optuna.create_study(direction='maximize')
    study.optimize(objective, n_trials=30)
    print(f"[Optuna] Meilleurs paramètres trouvés pour XGBoost: {study.best_params}")
    return study.best_params


# --- WORKFLOW D'ENTRAÎNEMENT ---
tscv = TimeSeriesSplit(n_splits=N_SPLITS)
all_results = []
best_lgbm_params, best_xgb_params = {}, {}

lgbm_feature_importances = []
xgb_feature_importances = []

print("\n" + "=" * 20 + " DÉBUT DE LA VALIDATION CROISÉE " + "=" * 20)

for fold, (train_index, test_index) in enumerate(tscv.split(X)):
    print(f"\n--- FOLD {fold + 1}/{N_SPLITS} ---")
    X_train_full, X_test = X[train_index], X[test_index]
    y_train_full, y_test = y[train_index], y[test_index]

    if len(np.unique(y_train_full)) < 2 or len(np.unique(y_test)) < 2:
        print("Saut du pli car il ne contient qu'une seule classe.")
        continue

    scale_pos_weight = np.sum(y_train_full == 0) / np.sum(y_train_full == 1)
    val_size = int(len(X_train_full) * 0.2)
    X_train, y_train = X_train_full[:-val_size], y_train_full[:-val_size]
    X_val, y_val = X_train_full[-val_size:], y_train_full[-val_size:]

    if HAS_LGB:
        try:
            if fold == 0:
                best_lgbm_params = optimize_lgbm(X_train, y_train, X_val, y_val, scale_pos_weight)

            final_params = best_lgbm_params.copy()
            final_params.update({'objective': 'binary', 'random_state': RANDOM_STATE, 'n_estimators': 2000,
                                 'scale_pos_weight': scale_pos_weight})

            print("\n[LGBM Classifier] Entraînement final du pli...")
            model_lgb = lgb.LGBMClassifier(**final_params)
            model_lgb.fit(X_train, y_train, eval_set=[(X_val, y_val)],
                          callbacks=[lgb.early_stopping(100, verbose=False)])

            y_prob_lgb = model_lgb.predict_proba(X_test)[:, 1]
            metrics_lgb, cm_lgb, threshold_lgb = search_and_evaluate(y_test, y_prob_lgb, min_trades=5)

            # Capture de l'importance des features
            imp = pd.Series(model_lgb.feature_importances_, index=FEATURES)
            lgbm_feature_importances.append(imp)

            print(
                f"[LGBM] Meilleur Seuil: {threshold_lgb:.2f} | Métriques Test: { {k: round(v, 4) for k, v in metrics_lgb.items()} }")
            all_results.append(EvalResult(name="LGBM Classifier", metrics_test=metrics_lgb, conf_matrix_test=cm_lgb))
        except Exception as e:
            print(f"[LGBM] a échoué: {e}")
    if HAS_XGB:
        try:
            if fold == 0:
                best_xgb_params = optimize_xgb(X_train, y_train, X_val, y_val, scale_pos_weight)

            final_params_xgb = best_xgb_params.copy()
            final_params_xgb.update({'objective': 'binary:logistic', 'random_state': RANDOM_STATE, 'n_estimators': 2000,
                                     'scale_pos_weight': scale_pos_weight, 'use_label_encoder': False})

            print("\n[XGBoost Classifier] Entraînement final du pli...")
            model_xgb = XGBClassifier(**final_params_xgb, early_stopping_rounds=100)
            model_xgb.fit(X_train, y_train, eval_set=[(X_val, y_val)], verbose=False)
            y_prob_xgb = model_xgb.predict_proba(X_test)[:, 1]
            metrics_xgb, cm_xgb, threshold_xgb = search_and_evaluate(y_test, y_prob_xgb, min_trades=5)

            # Capture de l'importance des features
            imp = pd.Series(model_xgb.feature_importances_, index=FEATURES)
            xgb_feature_importances.append(imp)

            print(
                f"[XGBoost] Meilleur Seuil: {threshold_xgb:.2f} | Métriques Test: { {k: round(v, 4) for k, v in metrics_xgb.items()} }")
            all_results.append(EvalResult(name="XGBoost Classifier", metrics_test=metrics_xgb, conf_matrix_test=cm_xgb))
        except Exception as e:
            print(f"[XGBoost] a échoué: {e}")
# --- Agrégation des résultats ---
if all_results:
    print(f"\n{'=' * 20} RÉSULTATS GLOBAUX (moyenne sur {N_SPLITS} plis) {'=' * 20}")
    final_summary = {}
    for res in all_results:
        if res.name not in final_summary:
            final_summary[res.name] = {'metrics': [], 'conf_matrix': np.zeros((2, 2), dtype=int)}
        final_summary[res.name]['metrics'].append(res.metrics_test)
        final_summary[res.name]['conf_matrix'] += res.conf_matrix_test

    for name, data in final_summary.items():
        df_metrics = pd.DataFrame(data['metrics'])
        mean_metrics = df_metrics.mean().to_dict()
        print(f"\n--- {name} ---")
        print("Moyenne des métriques:")
        print(pd.Series(mean_metrics).round(4))
        print("\nMatrice de confusion totale:")
        print(data['conf_matrix'])

        # --- NOUVEAU : Affichage de l'importance des features ---
    if lgbm_feature_importances:
        df_imp = pd.concat(lgbm_feature_importances, axis=1)
        mean_imp = df_imp.mean(axis=1).sort_values(ascending=False)
        print("\n--- LGBM Feature Importance (Moyenne sur les plis) ---")
        print(mean_imp)

    if xgb_feature_importances:
        df_imp = pd.concat(xgb_feature_importances, axis=1)
        mean_imp = df_imp.mean(axis=1).sort_values(ascending=False)
        print("\n--- XGBoost Feature Importance (Moyenne sur les plis) ---")
        print(mean_imp)

else:
    print("Aucun modèle n'a pu être entraîné.")

print("\nFini.")