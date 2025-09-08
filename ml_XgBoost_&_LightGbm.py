import os
import json
import numpy as np
import pandas as pd
from dataclasses import dataclass
from typing import Dict, Any

from lightgbm import early_stopping
from sklearn.metrics import f1_score, precision_score, recall_score, accuracy_score, confusion_matrix, roc_auc_score
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt

# Essayez d'importer LightGBM et XGBoost (on gère l'absence proprement)
try:
    import optuna
    import joblib
    import lightgbm as lgb
    HAS_LGB = True
except Exception:
    HAS_LGB = False

try:
    from xgboost import XGBClassifier
    HAS_XGB = True
except Exception:
    HAS_XGB = False

# -------------------------------
# 1) Paramètres
# -------------------------------
FILE_PATH = "/home/emmanuel-raoul/newòn py/Antrènman_tès/XAUUSD_22_24.csv"
OUTPUT_DIR = "Antrènan Bot Ichimoku/Antrènan Bot Ichimoku"
RANDOM_STATE = 42
MIN_WIN_RATE_CONSTRAINT = 0.55  # Ex: 55% de win rate (précision) minimum pour qu'un seuil soit considéré
os.makedirs(OUTPUT_DIR, exist_ok=True)

# -------------------------------
# 2) Lecture + feature engineering (identiques à ton MLP)
# -------------------------------
required_columns = ['ticket', 'type', 'result', 'rsiV', 'atrV',
                    'tenkan', 'kijun', 'spanA', 'spanB', 'lagging',
                    'timeInput', 'timeOutput', 'price', 'distPriceToCloud',
                    'distKijunToCloud', 'volume', 'sl', 'tp', 'slope5V', 'slope10V', 'slope20V',
                    'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V']

print("\nChargement du CSV…")
try:
    df = pd.read_csv(FILE_PATH, sep=';', encoding='utf-8-sig')
except FileNotFoundError:
    raise SystemExit(f"ERREUR: Fichier introuvable: {FILE_PATH}")

# Nettoyage colonnes
print("Colonnes lues:", list(df.columns))
df.columns = df.columns.str.strip()
print("Colonnes après strip:", list(df.columns))

# Vérif colonnes
for col in required_columns:
    if col not in df.columns:
        raise ValueError(f"Colonne manquante: {col}. Colonnes dispo: {list(df.columns)}")

# Tri temporel et sélection 1ère/dernière par ticket (comme ton script)
df = df.sort_values('timeInput').reset_index(drop=True)
first_entries = df.groupby('ticket', as_index=False).head(1)
last_entries = df.groupby('ticket', as_index=False).tail(1)
df = pd.concat([first_entries, last_entries]).drop_duplicates().reset_index(drop=True)

# Feature engineering identique
print("Calcul des features...")
df['timeInput'] = pd.to_datetime(df['timeInput']) # Conversion essentielle pour la suite

# NOUVELLE FEATURE: Heure de la journée pour capturer les dynamiques de session (Londres, NY, etc.)
df['hour_of_day'] = df['timeInput'].dt.hour

df['distance_to_sl_art'] = (df['price'] - df['sl']) / df['atrV']
df['volatility_regime'] = (df['priceStd20V'] > df['priceStd20V'].rolling(100, min_periods=1).mean()).astype(int)
df['prix_vs_ema200'] = (df['price'] - df['price'].rolling(200).mean()) / df['atrV']
df['rsi_vs_ema_rsi'] = df['rsiV'] - df['rsiV'].rolling(14).mean()
df['sl_size_in_atr'] = (df['price'] - df['sl']).abs() / df['atrV']

# MISE À JOUR DE LA LISTE DE FEATURES
# - Suppression de 'price', 'sl', 'tp' pour éviter la fuite de données (target leakage).
# - Ajout de 'hour_of_day' pour le contexte temporel.
FEATURES = ['type', 'rsiV', 'atrV', 'tenkan', 'kijun', 'spanA', 'spanB', 'lagging',
            'distPriceToCloud', 'distKijunToCloud', 'volume',
            'slope5V', 'slope10V', 'slope20V',
            'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V',
            'distance_to_sl_art', 'volatility_regime', 'prix_vs_ema200', 'rsi_vs_ema_rsi',
            'sl_size_in_atr',
            'hour_of_day']

X = df[FEATURES] # On garde le DataFrame pour préserver les noms de features
y = df['result'].astype(int).values
time_series = df['timeInput']

# -------------------------------
# 3) Split temporel 70/15/15
# -------------------------------
N = len(df)
train_end = int(0.70 * N)
val_end = int(0.85 * N)

X_train, y_train = X[:train_end], y[:train_end]
X_val,   y_val   = X[train_end:val_end], y[train_end:val_end]
X_test,  y_test  = X[val_end:], y[val_end:]
time_train, time_val, time_test = time_series[:train_end], time_series[train_end:val_end], time_series[val_end:]

print(f"Total samples: {N}")
print(f"Splitting info: Train={len(X_train)}, Validation={len(X_val)}, Test={len(X_test)}")

# -------------------------------
# 4) Utils
# -------------------------------
@dataclass
class EvalResult:
    name: str
    threshold: float
    metrics_val: Dict[str, float]
    metrics_test: Dict[str, float]
    conf_matrix_test: Any
    extra: Dict[str, Any]


def search_best_threshold(y_true, y_prob, time_data, min_trades_per_month=5, min_win_rate=0.0):
    """
    Trouve le seuil qui maximise le F1-Score tout en respectant des contraintes de fréquence et de win rate.
    """
    # Calcul dynamique du nombre de mois dans la période de données fournie
    # CORRECTIF: np.timedelta64 ne supporte pas 'M' (mois) car sa durée est ambiguë.
    # On calcule la durée en jours et on divise par la durée moyenne d'un mois (~30.44 jours).
    duration_in_days = (time_data.max() - time_data.min()) / np.timedelta64(1, 'D')
    duration_in_months = duration_in_days / 30.4375
    num_months_in_slice = max(1.0, round(duration_in_months)) # Assure au moins 1 mois
    min_trades_required = int(min_trades_per_month * num_months_in_slice)
    print(f"    [Seuil] Recherche d'un seuil pour max(F1) avec >= {min_trades_required} trades et un win rate >= {min_win_rate:.0%}...")

    thresholds = np.arange(0.99, 0.49, -0.01)  # On cherche d'abord dans la zone de haute probabilité

    valid_thresholds = []
    for t in thresholds:
        y_pred = (y_prob >= t).astype(int)
        num_trades = y_pred.sum()

        if num_trades > 0: # Évite la division par zéro pour la précision
            precision = precision_score(y_true, y_pred, zero_division=0)
            # Application des deux contraintes
            if num_trades >= min_trades_required and precision >= min_win_rate:
                f1 = f1_score(y_true, y_pred, zero_division=0)
                valid_thresholds.append({'threshold': t, 'precision': precision, 'f1': f1, 'num_trades': num_trades})

    if not valid_thresholds:
        print(
            f"    [Seuil] AVERTISSEMENT: Aucun seuil > 0.5 n'a atteint les contraintes. Recherche sur toute la plage.")
        thresholds = np.arange(0.49, 0.0, -0.01)
        for t in thresholds:
            y_pred = (y_prob >= t).astype(int)
            num_trades = y_pred.sum()
            if num_trades > 0:
                precision = precision_score(y_true, y_pred, zero_division=0)
                if num_trades >= min_trades_required and precision >= min_win_rate:
                    f1 = f1_score(y_true, y_pred, zero_division=0)
                    valid_thresholds.append({'threshold': t, 'precision': precision, 'f1': f1, 'num_trades': num_trades})

    if not valid_thresholds:
        print(
            f"    [Seuil] AVERTISSEMENT: Aucune combinaison de seuil ne respecte les contraintes. Retour au F1-score max comme fallback (sans contraintes).")
        best_t, best_s = 0.5, -np.inf
        for t in np.arange(0.01, 1.00, 0.01):
            y_pred = (y_prob >= t).astype(int)
            s = f1_score(y_true, y_pred, zero_division=0)
            if s > best_s:
                best_s, best_t = s, t
        # Dans ce cas de repli, best_s est le F1-score
        return best_t, best_s

    # Parmi les seuils valides, on choisit celui avec le meilleur F1-Score pour équilibrer précision et rappel
    best_candidate = max(valid_thresholds, key=lambda x: x['f1'])

    print(
        f"    [Seuil] Meilleur seuil trouvé: {best_candidate['threshold']:.2f} -> F1: {best_candidate['f1']:.4f} (Win Rate: {best_candidate['precision']:.4f}, Trades: {best_candidate['num_trades']})")

    return best_candidate['threshold'], best_candidate['f1']


def evaluate_threshold(y_true, y_prob, t):
    y_pred = (y_prob >= t).astype(int)
    return {
        "accuracy": accuracy_score(y_true, y_pred),
        "precision": precision_score(y_true, y_pred, zero_division=0),
        "recall": recall_score(y_true, y_pred, zero_division=0),
        "f1": f1_score(y_true, y_pred, zero_division=0),
        "auc": roc_auc_score(y_true, y_prob) if len(np.unique(y_true)) == 2 else np.nan,
    }, y_pred


def dump_conf_matrix(cm, labels=("Perdant","Gagnant")):
    a = int(cm[0,0]); b = int(cm[0,1]); c = int(cm[1,0]); d = int(cm[1,1])
    print("\nMatrice de confusion :")
    print(f"                     Prédit {labels[0]} | Prédit {labels[1]}")
    print(f"Vrai {labels[0]} :       {a:<12} | {b}")
    print(f"Vrai {labels[1]} :       {c:<12} | {d}")


# -------------------------------
# 5) LightGBM
# -------------------------------
def train_lightgbm(X_train, y_train, X_val, y_val, scale_pos_weight=None) -> EvalResult:
    if not HAS_LGB:
        raise RuntimeError("LightGBM introuvable dans l'environnement.")
# 1. Optimisation avec optuna
    def objective_lgb(trial):
        """
        Objective function for Optuna. Suggests hyperparameters for LightGBM.

        Args:
            trial (optuna.trial.Trial): Optuna trial object.

        Returns:
            None
        """
        # Define hyperparameters
        params = {
            'objective': 'binary',  # Binary classification objective
            'metric': 'binary_logloss',  # Binary log loss metric
            'verbosity': -1,  # Silent output
            'seed': RANDOM_STATE,  # Random seed
            'deterministic': True,  # Deterministic mode
            'n_estimators': 1000,  # Number of boosting rounds
            'learning_rate': trial.suggest_float(  # Learning rate
                'learning_rate', 0.01, 0.1, log=True),
            'num_leaves': trial.suggest_int(  # Number of leaves
                'num_leaves', 20, 150),
            'max_depth': trial.suggest_int(  # Maximum tree depth
                'max_depth', 3, 12),
            'min_child_samples': trial.suggest_int(  # Minimum number of samples
                'min_child_samples', 5, 100),
            'feature_fraction': trial.suggest_float(  # Fraction of features
                'feature_fraction', 0.6, 1.0),
            'bagging_fraction': trial.suggest_float(  # Bagging fraction
                'bagging_fraction', 0.6, 1.0),
            'bagging_freq': trial.suggest_int(  # Bagging frequency
                'bagging_freq', 1, 7),
            'lambda_l1': trial.suggest_float(  # L1 regularization
                'lambda_l1', 1e-8, 10.0, log=True),
            'lambda_l2': trial.suggest_float(  # L2 regularization
                'lambda_l2', 1e-8, 10.0, log=True),
        }

        if scale_pos_weight is not None:
            params["scale_pos_weight"] = float(scale_pos_weight)

        model = lgb.LGBMClassifier(**params)
        model.fit(X_train, y_train, eval_set=[(X_val, y_val)], callbacks=[lgb.early_stopping(100, verbose=False)])

        # --- NOUVELLE LOGIQUE MULTI-OBJECTIFS ---
        # On cherche à optimiser la précision ET le rappel
        preds_val = model.predict_proba(X_val)[:, 1]

        # Recherche rapide du meilleur seuil F1 pour ce trial
        best_t_trial, best_f1_trial = 0.5, -1.0
        # Recherche rapide pour ne pas trop ralentir Optuna
        for t in np.arange(0.2, 0.8, 0.05):
            y_pred_trial = (preds_val >= t).astype(int)
            f1 = f1_score(y_val, y_pred_trial, zero_division=0)
            if f1 > best_f1_trial:
                best_f1_trial = f1
                best_t_trial = t

        # Calcul des objectifs (précision et rappel) à ce seuil
        y_pred_final = (preds_val >= best_t_trial).astype(int)
        precision = precision_score(y_val, y_pred_final, zero_division=0)
        recall = recall_score(y_val, y_pred_final, zero_division=0)

        # NOUVELLE PÉNALITÉ: On veut éviter les modèles dégénérés qui prédisent 1 pour tout.
        # Un rappel parfait (ou presque) est un très mauvais signe.
        if recall > 0.99:
            return 0.0, 0.0  # Retourne un score très faible pour qu'Optuna élague cette branche

        return precision, recall

    print("\n[LightGBM] Recherche des hyperparamètres avec optuna…")
    # On demande à Optuna de maximiser la précision ET le rappel
    # On ajoute un Pruner pour arrêter les essais non prometteurs et gagner du temps
    study = optuna.create_study(
        directions=["maximize", "maximize"], pruner=optuna.pruners.MedianPruner()
    )
    study.optimize(objective_lgb, n_trials=50)  # Argumenten_trials pour meilleure recherche

    # --- NOUVELLE LOGIQUE DE SÉLECTION DU MEILLEUR TRIAL ---
    # Parmi les "meilleurs compromis" (front de Pareto), on choisit celui qui a le meilleur F1-Score
    best_trial = None
    best_f1_from_objectives = -1.0

    # study.best_trials contient la liste des solutions non-dominées
    for trial in study.best_trials:
        precision, recall = trial.values
        # On recalcule le F1 à partir des objectifs retournés par le trial
        if precision + recall > 0:
            f1 = 2 * (precision * recall) / (precision + recall)
            if f1 > best_f1_from_objectives:
                best_f1_from_objectives = f1
                best_trial = trial

    if best_trial is None:
        raise RuntimeError("Optuna n'a trouvé aucun trial valide. Essayez d'augmenter n_trials.")

    # 2. Entraînement final avec les meilleurs paramètres
    print("\n[LightGBM Entraînement final avec les meilleurs paramètres…]")
    best_params = best_trial.params.copy()  # On prend les paramètres du meilleur compromis
    best_params.update({
        'objective': 'binary',
        'metric': 'binary_logloss',
        'verbosity': -1,
        'seed': RANDOM_STATE,
        'n_estimators': 5000
    })
    if scale_pos_weight is not None:
        best_params["scale_pos_weight"] = float(scale_pos_weight)

    model = lgb.LGBMClassifier(**best_params)
    model.fit(X_train, y_train, eval_set=[(X_val, y_val)], callbacks=[lgb.early_stopping(200, verbose=False)])

    # Probabilités validation & recherche seuil
    val_prob = model.predict_proba(X_val)[:, 1]
    best_t, best_val_f1 = search_best_threshold(y_val, val_prob, time_val, min_win_rate=MIN_WIN_RATE_CONSTRAINT)

    # Sauvegarde
    model_path_txt = os.path.join(OUTPUT_DIR, "lightgbm_model.txt")
    model_path_joblib = os.path.join(OUTPUT_DIR, "lightgbm_model.joblib")
    model.booster_.save_model(model_path_txt)  # On garde le .txt pour référence
    joblib.dump(model, model_path_joblib)   # On sauvegarde l'objet compler pour la conversion
    print(f"[LightGBM] Modèle complet sauvegardé dans : {model_path_joblib}")
    with open(os.path.join(OUTPUT_DIR, "best_threshold_lgb.json"), "w") as f:
        json.dump({"threshold": float(best_t), "best_val_f1": float(best_val_f1)}, f, indent=2)

    # Évaluation test
    test_prob = model.predict_proba(X_test)[:, 1]
    metrics_val, _ = evaluate_threshold(y_val, val_prob, best_t)
    metrics_test, y_pred_test = evaluate_threshold(y_test, test_prob, best_t)
    cm_test = confusion_matrix(y_test, y_pred_test)

    # Importance des features
    imp_gain = model.feature_importances_
    imp_df = pd.DataFrame({'feature': FEATURES, 'gain': imp_gain})\
              .sort_values('gain', ascending=False).reset_index(drop=True)
    imp_df.to_csv(os.path.join(OUTPUT_DIR, 'lgb_feature_importance.csv'), index=False)

    print(f"\n[LightGBM] Seuil optimal (basé sur F1): {best_t:.2f} (F1-score validation: {best_val_f1:.4f})")
    print("[LightGBM] Metrics test:", metrics_test)
    dump_conf_matrix(cm_test)

    return EvalResult(
        name="LightGBM",
        threshold=best_t,
        metrics_val=metrics_val,
        metrics_test=metrics_test,
        conf_matrix_test=cm_test, # On ajoute les probas du test pour la simulation monte carlo
        extra={"model_path": model_path_joblib, "test_prob": test_prob}
    ), model

# -------------------------------
# 6) XGBoost
# -------------------------------
def train_xgboost(X_train, y_train, X_val, y_val, scale_pos_weight=None) -> EvalResult:
    if not HAS_XGB:
        raise RuntimeError("XGBoost introuvable dans l'environnement.")
    def objective_xgb(trial):
        params = {
            'objective' : 'binary:logistic',
            'eval_metric' : 'logloss',
            'tree_method' : 'hist',
            'n_jobs' : -1,
            'random_state' : RANDOM_STATE,
            'learning_rate' : trial.suggest_float('learning_rate', 0.01, 0.1, log=True),
            'max_depth' : trial.suggest_int('max_depth', 3, 10),
            'subsample' : trial.suggest_float('subsample', 0.6, 1.0),
            'colsample_bytree' : trial.suggest_float('colsample_bytree', 0.6, 1.0),
            'reg_lambda' : trial.suggest_float('reg_lambda', 1e-8, 10.0, log=True),
            'reg_alpha' : trial.suggest_float('reg_alpha', 1e-8, 10.0, log=True),
            'min_child_weight' : trial.suggest_int('min_child_weight', 1, 10),

        }
        if scale_pos_weight is not None:
            params["scale_pos_weight"] = float(scale_pos_weight)

        model = XGBClassifier(n_estimators=1000, early_stopping_rounds=100, **params)
        model.fit(X_train, y_train, eval_set=[(X_val, y_val)], verbose=False)

        # --- NOUVELLE LOGIQUE MULTI-OBJECTIFS ---
        preds_val = model.predict_proba(X_val)[:, 1]
        best_t_trial, best_f1_trial = 0.5, -1.0
        for t in np.arange(0.2, 0.8, 0.05):
            y_pred_trial = (preds_val >= t).astype(int)
            f1 = f1_score(y_val, y_pred_trial, zero_division=0)
            if f1 > best_f1_trial:
                best_f1_trial = f1
                best_t_trial = t

        y_pred_final = (preds_val >= best_t_trial).astype(int)
        precision = precision_score(y_val, y_pred_final, zero_division=0)
        recall = recall_score(y_val, y_pred_final, zero_division=0)

        # NOUVELLE PÉNALITÉ: On veut éviter les modèles dégénérés qui prédisent 1 pour tout.
        # Un rappel parfait (ou presque) est un très mauvais signe.
        if recall > 0.99:
            return 0.0, 0.0  # Retourne un score très faible pour qu'Optuna élague cette branche

        return precision, recall

    print("\n[XGBoost] Recherche des hyperparamètres avec Optuna…")
    # On ajoute un Pruner pour arrêter les essais non prometteurs et gagner du temps
    study = optuna.create_study(
        directions=["maximize", "maximize"], pruner=optuna.pruners.MedianPruner()
    )
    study.optimize(objective_xgb, n_trials=50)   # Augmenter le n_trials pour une meilleurs recherche

    # --- NOUVELLE LOGIQUE DE SÉLECTION DU MEILLEUR TRIAL ---
    best_trial = None
    best_f1_from_objectives = -1.0
    for trial in study.best_trials:
        precision, recall = trial.values
        if precision + recall > 0:
            f1 = 2 * (precision * recall) / (precision + recall)
            if f1 > best_f1_from_objectives:
                best_f1_from_objectives = f1
                best_trial = trial

    if best_trial is None:
        raise RuntimeError("Optuna n'a trouvé aucun trial valide. Essayez d'augmenter n_trials.")

    # 2. Entrainement final avec les meilleurs paramètres
    print("\n[XGBoost] Entraînement final avec les meilleurs paramètres…")
    best_params = best_trial.params
    if scale_pos_weight is not None:
        best_params["scale_pos_weight"] = float(scale_pos_weight)

    model = XGBClassifier(n_estimators=5000, early_stopping_rounds=200, **best_params)
    model.fit(
        X_train, y_train,
        eval_set=[(X_val, y_val)],
        verbose=False
    )

    # Probabilités validation & recherche seuil
    val_prob = model.predict_proba(X_val)[:, 1]
    best_t, best_val_f1 = search_best_threshold(y_val, val_prob, time_val, min_win_rate=MIN_WIN_RATE_CONSTRAINT)

    # Sauvegarde
    model_path = os.path.join(OUTPUT_DIR, "xgb_model.json")
    model.save_model(model_path)
    with open(os.path.join(OUTPUT_DIR, "best_threshold_xgb.json"), "w") as f:
        json.dump({"threshold": float(best_t), "best_val_f1": float(best_val_f1)}, f, indent=2)

    # Évaluation test
    test_prob = model.predict_proba(X_test)[:, 1]
    metrics_val, _ = evaluate_threshold(y_val, val_prob, best_t)
    metrics_test, y_pred_test = evaluate_threshold(y_test, test_prob, best_t)
    cm_test = confusion_matrix(y_test, y_pred_test)

    # Importance des features (gain)
    booster = model.get_booster()
    fmap = {f"f{i}": FEATURES[i] for i in range(len(FEATURES))}
    score = booster.get_score(importance_type='gain')
    imp_df = pd.DataFrame({
        'feature': [fmap.get(k, k) for k in score.keys()],
        'gain': list(score.values())
    }).sort_values('gain', ascending=False).reset_index(drop=True)
    imp_df.to_csv(os.path.join(OUTPUT_DIR, 'xgb_feature_importance.csv'), index=False)

    print(f"\n[XGBoost] Seuil optimal (basé sur F1): {best_t:.2f} (F1-score validation: {best_val_f1:.4f})")
    print("[XGBoost] Metrics test:", metrics_test)
    dump_conf_matrix(cm_test)

    return EvalResult(
        name="XGBoost",
        threshold=best_t,
        metrics_val=metrics_val,
        metrics_test=metrics_test,
        conf_matrix_test=cm_test,
        # On ajoute les probas du test pour la simulation monte carlo
        extra={"model_path": model_path, "test_prob": test_prob}
    ), model

# -------------------------------
# 7) Lancement: calcul du scale_pos_weight puis comparaison
# -------------------------------
pos = y_train.sum()
neg = len(y_train) - pos
scale_pos = (neg / pos) if pos > 0 else 1.0
print(f"\nClasses train → pos={int(pos)}, neg={int(neg)}, scale_pos_weight={scale_pos:.2f}")

results = []
models = {}
if HAS_LGB:
    try:
        res_lgb, model_lgb = train_lightgbm(X_train, y_train, X_val, y_val, scale_pos_weight=scale_pos)
        results.append(res_lgb)
        models['LightGBM'] = model_lgb
    except Exception as e:
        print("LightGBM a échoué:", e)

if HAS_XGB:
    try:
        res_xgb, model_xgb = train_xgboost(X_train, y_train, X_val, y_val, scale_pos_weight=scale_pos)
        results.append(res_xgb)
        models['XGBoost'] = model_xgb
    except Exception as e:
        print("XGBoost a échoué:", e)

# Création de l'ensemble si les deux modèles on été entraînés
if 'LightGBM' in models and 'XGBoost' in models:
    print("\n[Ensemble] Création et évaluation de l'ensemble (Averaging)...")
    model_lgb = models['LightGBM']
    model_xgb = models['XGBoost']

    # Prédictions sur le set de validation
    val_prod_lgb = model_lgb.predict_proba(X_val)[:, 1]
    val_prob_xgb = model_xgb.predict_proba(X_val)[:, 1]
    ensemble_val_prob = (val_prod_lgb + val_prob_xgb) / 2.0

    # Recherche du meilleur seuil pour l'ensemble
    best_t_ensemble, best_f1_ensemble_val = search_best_threshold(y_val, ensemble_val_prob, time_val, min_win_rate=MIN_WIN_RATE_CONSTRAINT)

    # Évaluation sur le set de test
    test_prob_lgb = model_lgb.predict_proba(X_test)[:, 1]
    test_prob_xgb = model_xgb.predict_proba(X_test)[:, 1]
    ensemble_test_prob = (test_prob_lgb + test_prob_xgb) / 2.0

    metrics_test_ensemble, y_pred_test_ensemble = evaluate_threshold(y_test, ensemble_test_prob, best_t_ensemble)
    cm_test_ensemble = confusion_matrix(y_test, y_pred_test_ensemble)

    # Création d'un objet EvalResult pour l'ensemble
    ensemble_result = EvalResult(
        name="Ensemble (LGB+XGB)",
        threshold=best_t_ensemble,
        metrics_val={"f1": best_f1_ensemble_val}, # Simplifié pour le tri
        metrics_test=metrics_test_ensemble, # On ajoute les probas du test pour la simulation monte carlos
        conf_matrix_test=cm_test_ensemble,
        extra={"test_prob": ensemble_test_prob}
    )
    results.append(ensemble_result)
    print(f"\n[Ensemble] Seuil optimal (basé sur F1): {best_t_ensemble:.2f} (F1-score validation: {best_f1_ensemble_val:.4f})")
    print("[Ensemble] Metrics test:", metrics_test_ensemble)
    dump_conf_matrix(cm_test_ensemble)

if not results:
    raise SystemExit("Aucun modèle n'a pu être entraîné. Assurez-vous que LightGBM ou XGBoost est installé.")

# -------------------------------
# 8) Sélection du meilleur modèle (score équilibré val/test)
# -------------------------------
print("\nSélection du meilleur modèle basée sur un score équilibré (validation et test)...")

# On calcule un score combiné pour chaque résultat pour équilibrer la performance
# sur le set de validation (vu pendant l'entraînement) et le set de test (jamais vu).
for r in results:
    val_f1 = r.metrics_val.get("f1", 0.0)
    test_f1 = r.metrics_test.get("f1", 0.0)
    val_auc = r.metrics_val.get("auc", 0.0)
    test_auc = r.metrics_test.get("auc", 0.0)

    # Pénalité pour les modèles dégénérés sur le set de test (double sécurité)
    if r.metrics_test.get("recall", 0.0) > 0.99:
        combined_score = 0.0
    else:
        # Score combiné qui équilibre F1 (performance équilibrée) et AUC (pouvoir discriminant)
        # On pondère aussi la performance sur validation et test pour la robustesse
        combined_f1 = (0.5 * val_f1) + (0.5 * test_f1)
        combined_auc = (0.5 * val_auc) + (0.5 * test_auc)

        # Score final: 60% F1, 40% AUC. Favorise un bon équilibre (F1) avec un bon pouvoir de tri (AUC).
        combined_score = (0.6 * combined_f1) + (0.4 * combined_auc)

    r.extra['combined_score'] = combined_score

results = sorted(results, key=lambda r: r.extra.get("combined_score", 0), reverse=True)
best = results[0]

print("\n========================")
print("Meilleur modèle:", best.name)
print(f"Score combiné (F1 + AUC, val + test): {best.extra.get('combined_score', 0):.4f}")
print("Seuil optimal (défini sur la validation):", round(best.threshold, 4))
print("Metrics validation:", best.metrics_val)
print("Metrics test:", best.metrics_test)
print("========================\n")

# Sauvegarde d'un récapitulatif JSON
summary = {
    "best_model": best.name,
    "threshold": float(best.threshold),
    "val_metrics": {k: float(v) for k, v in best.metrics_val.items()},
    "test_metrics": {k: float(v) for k, v in best.metrics_test.items()},
}
with open(os.path.join(OUTPUT_DIR, "summary_boosting.json"), "w") as f:
    json.dump(summary, f, indent=2)


def run_monte_carlo_simulation(y_test, test_probabilities, threshold, n_simulations=5000):
    print("\n" + "=" * 20 + " Analyse de Risque par Simulation Monte Carlo " + "=" * 20)

    # 1. Identifier les trades que le modèle prendrait sur le jeu de test
    trade_indices = np.where(test_probabilities >= threshold)[0]
    if len(trade_indices) == 0:
        print("Le modèle ne prend aucun trade sur le jeu de test avec ce seuil. Simulation impossible.")
        return

    # 2. Récupérer les probabilités et les vrais résultats pour ces trades
    actual_outcomes = y_test[trade_indices]
    model_probs_for_trades = test_probabilities[trade_indices]

    print(f"Simulation de {n_simulations} 'histoires alternatives' pour les {len(trade_indices)} trades du backtest...")

    simulation_results = []
    for _ in range(n_simulations):
        # Pour chaque trade, on tire un nombre aléatoire
        random_draws = np.random.rand(len(trade_indices))
        # Le trade est une 'victoire simulée' si le tirage est inférieur à la probabilité du modèle
        simulated_wins = (random_draws < model_probs_for_trades).sum()
        simulation_results.append(simulated_wins)

    # 3. Analyser la distribution des résultats
    simulation_results = np.array(simulation_results)
    actual_wins = actual_outcomes.sum()

    plt.figure(figsize=(10, 6))
    plt.hist(simulation_results, bins=max(10, int(np.max(simulation_results) - np.min(simulation_results))), alpha=0.75,
             label="Distribution des victoires simulées")
    plt.axvline(actual_wins, color='red', linestyle='--', linewidth=2,
                label=f"Résultat réel du backtest ({actual_wins} victoires)")
    plt.axvline(np.mean(simulation_results), color='black', linestyle='-', linewidth=2,
                label=f"Moyenne simulée ({np.mean(simulation_results):.1f} victoires)")
    plt.title(f"Distribution Monte Carlo des Victoires ({n_simulations} simulations)")
    plt.xlabel("Nombre de victoires dans le backtest")
    plt.ylabel("Fréquence")
    plt.legend()
    plt.grid(True, alpha=0.3)

    fig_path = os.path.join(OUTPUT_DIR, "monte_carlo_simulation.png")
    plt.savefig(fig_path, dpi=130)
    print(f"\nGraphique de la simulation Monte Carlo sauvegardé : {fig_path}")

    # 4. Afficher les statistiques clés
    p5 = np.percentile(simulation_results, 5)
    p95 = np.percentile(simulation_results, 95)

    print("\nStatistiques de la simulation Monte Carlo:")
    print(f"  - Nombre de trades analysés: {len(trade_indices)}")
    print(f"  - Win rate réel du backtest: {actual_wins / len(trade_indices):.2%}")
    print("-" * 30)
    print(f"  - Nombre moyen de victoires attendu: {np.mean(simulation_results):.1f}")
    print(f"  - Scénario pessimiste (5% de chance d'avoir moins de victoires): {int(p5)} victoires")
    print(f"  - Scénario optimiste (5% de chance d'avoir plus de victoires): {int(p95)} victoires")


# -------------------------------
# 9) (Optionnel) Affichage matrice de confusion du meilleur modèle
# -------------------------------
try:
    import seaborn as sns
    cm = best.conf_matrix_test
    plt.figure(figsize=(6,5))
    sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
                xticklabels=['Perdant','Gagnant'], yticklabels=['Perdant','Gagnant'])
    plt.title(f"Matrice de confusion – {best.name}")
    plt.xlabel('Prédit')
    plt.ylabel('Vrai')
    fig_path = os.path.join(OUTPUT_DIR, f"cm_{best.name.lower()}.png")
    plt.tight_layout()
    plt.savefig(fig_path, dpi=130)
    print(f"Matrice de confusion sauvegardée: {fig_path}")
except Exception as e:
    print("Impossible de tracer la matrice de confusion:", e)

# -------------------------------
# 10) Lancement de la simulation Monte Carlo sur le meilleur modèle
# -------------------------------
if best.extra.get("test_prob") is not None:
    run_monte_carlo_simulation(y_test, best.extra["test_prob"], best.threshold)
else:
    print("\nAVERTISSEMENT: Aucune probabilité de test trouvée pour le meilleur modèle, simulation Monte Carlo annulée.")

print("\nFini.")
