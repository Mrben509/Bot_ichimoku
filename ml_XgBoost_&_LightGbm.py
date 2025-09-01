import os
import json
import numpy as np
import pandas as pd
from dataclasses import dataclass
from typing import Dict, Any

from lightgbm import early_stopping
from sklearn.metrics import f1_score, precision_score, recall_score, accuracy_score, confusion_matrix, roc_auc_score
from sklearn.model_selection import TimeSeriesSplit
import matplotlib.pyplot as plt
import warnings

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

# Ignorer les avertissement de dépréciation de pandas
warnings.filterwarnings("ignore", category=FutureWarning, module="pandas")
# -------------------------------
# 1) Paramètres
# -------------------------------
FILE_PATH = "/home/emmanuel-raoul/newòn py/Antrènman_tès/XAUUSD_21_22.csv"
OUTPUT_DIR = "Antrènan Bot Ichimoku/Antrènan Bot Ichimoku"
RANDOM_STATE = 42
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

if 'ADX_14' not in df.columns:
     raise ValueError("La colonne 'ADX_14' est maintenant requise pour la feature 'adx_trend_strength'. Veuillez mettre à jour votre fichier CSV.")

# Tri temporel et sélection 1ère/dernière par ticket (comme ton script)
df = df.sort_values('timeInput').reset_index(drop=True)
# CORRECTIF CRITIQUE : Nous ne devons entraîner le modèle que sur les conditions au moment de l'entrée du trade.
df = df.groupby('ticket', as_index=False).head(1).reset_index(drop=True)


# Feature engineering identique
df['distance_to_sl_art'] = (df['price'] - df['sl']) / df['atrV']
df['volatility_regime'] = (df['priceStd20V'] > df['priceStd20V'].rolling(100, min_periods=1).mean()).astype(int)
df['prix_vs_ema200'] = (df['price'] - df['price'].rolling(200).mean()) / df['atrV']
df['rsi_vs_ema_rsi'] = df['rsiV'] - df['rsiV'].rolling(14).mean()

# On calcule le RRR. On gère la division par zéro si le sl est au même niveau que le prix.
sl_distance = (df['price'] - df['sl']).abs()
tp_distance = (df['tp'] - df['price']).abs()
df['risk_reward_ratio'] = tp_distance / sl_distance.replace(0, np.nan)

# --- AJOUT DE FEATURES DISCRIMINANTES - --
# 1. Features Ichimoku avancées
df['cloud_thickness'] = (df['spanA'] - df['spanB']).abs()
df['tk_cross_signal'] = np.sign(df['tenkan'] - df['kijun']) # renomer pour plus de clarté

# 2. Features de Momentum (pentes)
df['tenkan_slope'] = df['tenkan'].diff(3)  # Pente sur 3 périodes
df['kijun_slope'] = df['kijun'].diff(3)  # Pente sur 3

# 3. Features de Volatilité et de position relative
# Relative ATR
df['atr_relative'] = df['atrV'] / df['atrV'].rolling(50, min_periods=1).mean()

# Price position relative to Kijun (normalized by ATR)
df['price_vs_kijun'] = (df['price'] - df['kijun']) / df['atrV']

# Distance from cloud edges (normalized by ATR)
df['dist_from_spanA'] = (df['price'] - df['spanA']) / df['atrV']
df['dist_from_spanB'] = (df['price'] - df['spanB']) / df['atrV']

# Interaction feature for TK cross strength
df['tk_cross_strength'] = df['tk_cross_signal'] * df['tenkan_slope'].abs()

# --- NOUVELLE FEATURE : Stabilité du signal de croisement ---
# Compte le nombre de périodes consécutives où le signal de croisement n'a pas changé.
df['tk_cross_stability'] = df['tk_cross_signal'].rolling(window=5).apply(lambda x: (x == x.iloc[-1]).sum()).fillna(0)

# --- NOUVELLES FEATURES DE CARACTÈRE DE MARCHÉ ---
# 1. Stabilité du RSI: Un RSI stable est souvent plus significatif qu'un RSI qui oscille sauvagement.
df['rsi_stability'] = df['rsiV'].rolling(14).std()

# 2. Force de la tendance ADX: Catégoriser la force de la tendance peut aider le modèle à mieux interpréter les autres signaux.
df['adx_trend_strength'] = pd.cut(df['ADX_14'],
                                  bins=[0, 20, 25, 100],
                                  labels=[0, 1, 2],  # 0: Pas de tendance, 1: Tendance faible, 2: Tendance forte
                                  right=False).astype(int)

# --- FEATURES D'INTERACTION ---
# On combine des signaux pour donner plus de contexte au modèle.
# 1. Interaction entre la force du croisement et la force de la tendance ADX
df['cross_x_adx'] = df['tk_cross_strength'] * (df['adx_trend_strength'] + 1)  # +1 pour éviter de multiplier par 0

# 2. Interaction entre la position par rapport au Kijun et la stabilité du RSI
df['kijun_x_rsi_stab'] = df['price_vs_kijun'] * df['rsi_stability']

# Features temporelles
df['hour_of_day'] = pd.to_datetime(df['timeInput']).dt.hour

# --- NOUVELLE FEATURE : Taille du Stop Loss en ATR ---
# Mesure la taille du stop loss par rapport à la volatilité actuelle.
df['sl_size_in_atr'] = (df['price'] - df['sl']).abs() / df['atrV'].replace(0, np.nan)


FEATURES = ['type', 'rsiV', 'atrV', 'tenkan', 'kijun', 'spanA', 'spanB', 'lagging', 'price',
            'distPriceToCloud', 'distKijunToCloud', 'volume', 'sl', 'tp', 'slope5V', 'slope10V', 'slope20V',
            'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V',
            'distance_to_sl_art', 'volatility_regime', 'prix_vs_ema200', 'rsi_vs_ema_rsi',
            'sl_size_in_atr'] # Ajoute des nouvelles features de caractère

print(f"\nDataset initial: {len(df)} trades.")
print("\nNettoyage des données après feature engineering...")
# Les calculs (divisions, rolling means) peuvent créer des valeurs invalides (inf, NaN)
# que XGBoost ne peut pas gérer.

# 1. Remplacer les valeurs infinies par NaN
df.replace([np.inf, -np.inf], np.nan, inplace=True)

# 2. Remplir les valeurs NaN restantes.
# Une stratégie commune pour les séries temporelles est le "forward fill",
# puis on remplit les NaNs restants (au début du DF) avec 0.
df[FEATURES] = df[FEATURES].ffill().fillna(0)

X = df[FEATURES].astype(np.float32).values
y = df['result'].astype(int).values

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


def search_best_threshold(y_true, y_prob, df_val, min_trades_per_month=10):
    """
    Recherche le meilleur seuil de décision en fonction d'une double contrainte:
    1. Atteindre une fréquence de trading minimale.
    2. Parmi les seuils valides, maximiser la précision.
    """
    # 1. Calculer la durée du set de validation en mois pour la normalisation
    start_date = pd.to_datetime(df_val['timeInput'].min())
    end_date = pd.to_datetime(df_val['timeInput'].max())
    duration_months = (end_date - start_date).days / 30.44  # Durée moyenne d'un mois
    if duration_months < 1:
        duration_months = 1.0  # Eviter la division par 0 pour les petits datesets

    print(f"Durée du set de validation: {duration_months:.2f} mois. Objectif: >= {min_trades_per_month} traders/mois.")

    thresholds = np.arange(0.01, 1.00, 0.01)

    # Recherche du seuil F1-max comme baseline
    f1_scores = [f1_score(y_true, (y_prob >= t).astype(int), zero_division=0) for t in thresholds]
    best_t_f1 = thresholds[np.argmax(f1_scores)]
    print(f"Seuil F1-max de référence: {best_t_f1:.2f} (F1: {np.max(f1_scores):.4f})")

    # Recherche du meilleur seuil sous contrainte
    valid_thresholds = []
    for t in thresholds:
        y_pred = (y_prob >= t).astype(int)
        num_trades = np.sum(y_pred)
        trades_per_month = num_trades / duration_months if duration_months > 0 else 0

        if trades_per_month >= min_trades_per_month:
            precision = precision_score(y_true, y_pred, zero_division=0)
            valid_thresholds.append({'threshold': t, 'precision': precision, 'trades_per_month': trades_per_month})

    if not valid_thresholds:
        print(f"AVERTISSEMENT: Aucun seuil n'a atteint l'objectif de {min_trades_per_month} trades/mois. Utilisation du seuil F1-max.")
        return best_t_f1, np.max(f1_scores)

    # Parmi les seuils valides, choisir celui avec la meilleure précision
    best_constrained_result = max(valid_thresholds, key=lambda x: x['precision'])
    return best_constrained_result['threshold'], best_constrained_result['precision']


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
def optimize_lgbm(X_train, y_train, X_val, y_val, scale_pos_weight=None) -> Dict:
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
                'num_leaves', 20, 80),
            'max_depth': trial.suggest_int(  # Maximum tree depth
                'max_depth', 3, 7),
            'min_child_samples': trial.suggest_int(  # Minimum number of samples
                'min_child_samples', 20, 100),
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

        # On laisse Optuna trouver le meilleur poids pour les classes
        if scale_pos_weight is not None:
            params['scale_pos_weight'] = trial.suggest_float('scale_pos_weight', 1.0, scale_pos_weight * 2.0)

        model = lgb.LGBMClassifier(**params)
        model.fit(X_train, y_train, eval_set=[(X_val, y_val)], callbacks=[lgb.early_stopping(100, verbose=False)], feature_name=FEATURES)

        preds_val = model.predict_proba(X_val)[:, 1]
        thresholds = np.arange(0.01, 1.0, 0.01)
        f1_scores = [f1_score(y_val, (preds_val >= t).astype(int), zero_division=0) for t in thresholds]
        return np.max(f1_scores)


    print("\n[LightGBM] Recherche des hyperparamètres avec optuna…")
    study = optuna.create_study(direction="maximize")
    study.optimize(objective_lgb, n_trials=100)  # Argumenten_trials pour meilleure recherche
    print(f"Meilleurs paramètres trouvés pour LightGBM: {study.best_params}")
    return study.best_params

# -------------------------------
# 6) XGBoost
# -------------------------------
def optimize_xgb(X_train, y_train, X_val, y_val, scale_pos_weight=None) -> Dict:
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
            'max_depth' : trial.suggest_int('max_depth', 3, 7),
            'subsample' : trial.suggest_float('subsample', 0.6, 1.0),
            'colsample_bytree' : trial.suggest_float('colsample_bytree', 0.6, 1.0),
            'reg_lambda' : trial.suggest_float('reg_lambda', 1e-8, 10.0, log=True),
            'reg_alpha' : trial.suggest_float('reg_alpha', 1e-8, 10.0, log=True),
            'min_child_weight' : trial.suggest_int('min_child_weight', 5, 10),

        }
        # On laisse Optuna trouver le meilleur poids pour les classes
        if scale_pos_weight is not None:
            params['scale_pos_weight'] = trial.suggest_float('scale_pos_weight', 1.0, scale_pos_weight * 2.0)

        model = XGBClassifier(n_estimators=1000, early_stopping_rounds=100, **params)
        model.fit(X_train, y_train, eval_set=[(X_val, y_val)], verbose=False)

        preds_val = model.predict_proba(X_val)[:, 1]
        thresholds = np.arange(0.01, 1.0, 0.01)
        f1_scores = [f1_score(y_val, (preds_val >= t).astype(int), zero_division=0) for t in thresholds]
        return np.max(f1_scores)

    print("\n[XGBoost] Recherche des hyperparamètres avec Optuna…")
    study = optuna.create_study(direction="maximize")
    study.optimize(objective_xgb, n_trials=100)   # Augmenter le n_trials pour une meilleurs recherche
    print(f"Meilleurs paramètres trouvés pour XGBoost: {study.best_params}")
    return study.best_params

# -------------------------------
# 7) Lancement: calcul du scale_pos_weight puis comparaison
# -------------------------------

N_SPLITS = 5  # Nombre de plis pour la validation croisée

# --- PHASE 1: OPTIMISATION DES HYPERPARAMÈTRES (UNE SEULE FOIS) ---
print("\n" + "=" * 20 + " PHASE 1: OPTIMISATION DES HYPERPARAMÈTRES " + "=" * 20)
print("Utilisation du premier pli de validation pour trouver les meilleurs paramètres...")

# On prend le premier pli pour créer un jeu d'entraînement/validation pour l'optimisation
first_fold_tscv = TimeSeriesSplit(n_splits=N_SPLITS)
train_val_idx_optim, _ = next(iter(first_fold_tscv.split(X)))

X_train_val_optim, y_train_val_optim = X[train_val_idx_optim], y[train_val_idx_optim]

# On re-split ce premier pli en entraînement et validation pour Optuna
val_size_optim = int(len(X_train_val_optim) * 0.25)  # 25% pour la validation
train_size_optim = len(X_train_val_optim) - val_size_optim

X_train_optim, y_train_optim = X_train_val_optim[:train_size_optim], y_train_val_optim[:train_size_optim]
X_val_optim, y_val_optim = X_train_val_optim[train_size_optim:], y_train_val_optim[train_size_optim:]

pos_optim = y_train_optim.sum()
neg_optim = len(y_train_optim) - pos_optim
scale_pos_optim = (neg_optim / pos_optim) if pos_optim > 0 else 1.0

best_lgbm_params = {}
if HAS_LGB:
    best_lgbm_params = optimize_lgbm(X_train_optim, y_train_optim, X_val_optim, y_val_optim, scale_pos_optim)

best_xgb_params = {}
if HAS_XGB:
    best_xgb_params = optimize_xgb(X_train_optim, y_train_optim, X_val_optim, y_val_optim, scale_pos_optim)

# --- PHASE 2: VALIDATION CROISÉE AVEC LES MEILLEURS PARAMÈTRES ---
print("\n" + "=" * 20 + " PHASE 2: VALIDATION CROISÉE " + "=" * 20)
print("Évaluation des meilleurs paramètres sur tous les plis...")

tscv = TimeSeriesSplit(n_splits=N_SPLITS)

all_results = []

for fold, (train_val_index, test_index) in enumerate(tscv.split(X)):
    print(f"\n{'=' * 20} FOLD {fold + 1}/{N_SPLITS} {'=' * 20}")

    # 1. Découper les données pour le pli actuel
    X_train_val, y_train_val = X[train_val_index], y[train_val_index]
    X_test, y_test = X[test_index], y[test_index]

    # 2. Créer un sous-ensemble de validation à partir de la fin du jeu d'entraînement
    #    pour Optuna et l'early stopping.
    val_size = int(len(X_train_val) * 0.20)  # 20% pour la validation
    train_size = len(X_train_val) - val_size
    X_train, y_train = X_train_val[:train_size], y_train_val[:train_size]
    X_val, y_val = X_train_val[train_size:], y_train_val[train_size:]
    df_train_val = df.iloc[train_val_index]
    df_val = df_train_val.iloc[train_size:]
    print(f"Fold {fold + 1} split: Train={len(X_train)}, Validation={len(X_val)}, Test={len(X_test)}")

    # 3. Calculer le scale_pos_weight pour ce pli
    pos = y_train.sum()
    neg = len(y_train) - pos
    scale_pos = (neg / pos) if pos > 0 else 1.0
    print(f"Classes train (fold {fold + 1}) → pos={int(pos)}, neg={int(neg)}, scale_pos_weight={scale_pos:.2f}")

    fold_models = {}
    fold_results_list = []

    # 4. Entraîner les modèles sur ce pli
    if HAS_LGB:
        try:
            print("\n[LightGBM] Entraînement et évaluation...")
            lgbm_params = best_lgbm_params.copy()
            lgbm_params.update({
                'objective': 'binary', 'metric': 'binary_logloss', 'verbosity': -1,
                'seed': RANDOM_STATE, 'n_estimators': 5000
            })
            if 'scale_pos_weight' not in lgbm_params:  # Si Optuna ne l'a pas optimisé, on utilise celui du pli
                lgbm_params['scale_pos_weight'] = scale_pos

            model_lgb = lgb.LGBMClassifier(**lgbm_params)
            model_lgb.fit(X_train, y_train, eval_set=[(X_val, y_val)],
                          callbacks=[lgb.early_stopping(200, verbose=False)])

            val_prob_lgb = model_lgb.predict_proba(X_val)[:, 1]
            best_t_lgb, best_val_metric_lgb = search_best_threshold(y_val, val_prob_lgb, df_val,
                                                                    min_trades_per_month=10)
            metrics_val_lgb, _ = evaluate_threshold(y_val, val_prob_lgb, best_t_lgb)
            print(
                f"[LightGBM] Seuil optimal trouvé sur validation: {best_t_lgb:.2f} (Precision: {best_val_metric_lgb:.4f})")

            # Sauvegarde du modèle et du seuil (uniquement pour le dernier pli)
            if fold == N_SPLITS - 1:
                model_path_joblib = os.path.join(OUTPUT_DIR, "lightgbm_model.joblib")
                joblib.dump(model_lgb, model_path_joblib)
                print(f"[LightGBM] Modèle final sauvegardé dans : {model_path_joblib}")
                with open(os.path.join(OUTPUT_DIR, "best_threshold_lgb.json"), "w") as f:
                    json.dump({"threshold": float(best_t_lgb)}, f, indent=2)
                # Sauvegarde de l'importance des features du dernier pli
                imp_gain = model_lgb.feature_importances_
                imp_df = pd.DataFrame({'feature': FEATURES, 'gain': imp_gain}).sort_values('gain', ascending=False)
                imp_df.to_csv(os.path.join(OUTPUT_DIR, 'lgb_feature_importance.csv'), index=False)

            res_lgb = EvalResult(
                name="LightGBM",
                threshold=best_t_lgb,
                metrics_val=metrics_val_lgb,
                metrics_test={},
                conf_matrix_test=None,
                extra={}
            )

            # Évaluation sur le jeu de test du pli
            test_prob_lgb = model_lgb.predict_proba(X_test)[:, 1]
            res_lgb.metrics_test, y_pred_test_lgb = evaluate_threshold(y_test, test_prob_lgb, res_lgb.threshold)
            res_lgb.conf_matrix_test = confusion_matrix(y_test, y_pred_test_lgb)
            print(f"[LightGBM] Metrics test (fold {fold + 1}):",
                  {k: round(v, 4) for k, v in res_lgb.metrics_test.items()})
            dump_conf_matrix(res_lgb.conf_matrix_test)

            fold_results_list.append(res_lgb)
            fold_models['LightGBM'] = model_lgb
        except Exception as e:
            print(f"LightGBM a échoué pour le fold {fold + 1}:", e)

    if HAS_XGB:
        try:
            print("\n[XGBoost] Entraînement et évaluation...")
            xgb_params = best_xgb_params.copy()
            xgb_params.update({
                'objective': 'binary:logistic', 'eval_metric': 'logloss', 'tree_method': 'hist',
                'n_jobs': -1, 'random_state': RANDOM_STATE
            })
            if 'scale_pos_weight' not in xgb_params:
                xgb_params['scale_pos_weight'] = scale_pos

            model_xgb = XGBClassifier(n_estimators=5000, early_stopping_rounds=200, **xgb_params)
            model_xgb.fit(X_train, y_train, eval_set=[(X_val, y_val)], verbose=False)

            val_prob_xgb = model_xgb.predict_proba(X_val)[:, 1]
            best_t_xgb, best_val_metric_xgb = search_best_threshold(y_val, val_prob_xgb, df_val,
                                                                    min_trades_per_month=10)
            metrics_val_xgb, _ = evaluate_threshold(y_val, val_prob_xgb, best_t_xgb)
            print(
                f"[XGBoost] Seuil optimal trouvé sur validation: {best_t_xgb:.2f} (Precision: {best_val_metric_xgb:.4f})")

            # Sauvegarde du modèle et du seuil (uniquement pour le dernier pli)
            if fold == N_SPLITS - 1:
                model_path_json = os.path.join(OUTPUT_DIR, "xgb_model.json")
                model_xgb.save_model(model_path_json)
                print(f"[XGBoost] Modèle final sauvegardé dans : {model_path_json}")
                with open(os.path.join(OUTPUT_DIR, "best_threshold_xgb.json"), "w") as f:
                    json.dump({"threshold": float(best_t_xgb)}, f, indent=2)
                # Sauvegarde de l'importance des features du dernier pli
                score = model_xgb.get_booster().get_score(importance_type='gain')
                fmap = {f"f{i}": FEATURES[i] for i in range(len(FEATURES))}
                imp_df = pd.DataFrame(
                    {'feature': [fmap.get(k, k) for k in score.keys()], 'gain': list(score.values())}).sort_values(
                    'gain', ascending=False)
                imp_df.to_csv(os.path.join(OUTPUT_DIR, 'xgb_feature_importance.csv'), index=False)

            res_xgb = EvalResult(
                name="XGBoost",
                threshold=best_t_xgb,
                metrics_val=metrics_val_xgb,
                metrics_test={},
                conf_matrix_test=None,
                extra={}
            )

            # Évaluation sur le jeu de test du pli
            test_prob_xgb = model_xgb.predict_proba(X_test)[:, 1]
            res_xgb.metrics_test, y_pred_test_xgb = evaluate_threshold(y_test, test_prob_xgb, res_xgb.threshold)
            res_xgb.conf_matrix_test = confusion_matrix(y_test, y_pred_test_xgb)
            print(f"[XGBoost] Metrics test (fold {fold + 1}):",
                  {k: round(v, 4) for k, v in res_xgb.metrics_test.items()})
            dump_conf_matrix(res_xgb.conf_matrix_test)

            fold_results_list.append(res_xgb)
            fold_models['XGBoost'] = model_xgb
        except Exception as e:
            print(f"XGBoost a échoué pour le fold {fold + 1}:", e)

    # 5. Créer l'ensemble pour ce pli
    if 'LightGBM' in fold_models and 'XGBoost' in fold_models:
        print("\n[Ensemble] Création et évaluation de l'ensemble (Moyenne des probabilités)...")
        model_lgb = fold_models['LightGBM']
        model_xgb = fold_models['XGBoost']
        # Obtenir les probabilités sur les jeux de validation et de test
        val_prob_lgb = model_lgb.predict_proba(X_val)[:, 1]
        val_prob_xgb = model_xgb.predict_proba(X_val)[:, 1]
        test_prob_lgb = model_lgb.predict_proba(X_test)[:, 1]
        test_prob_xgb = model_xgb.predict_proba(X_test)[:, 1]

        # Créer les probabilités de l'ensemble en moyennant
        ensemble_val_prob = (val_prob_lgb + val_prob_xgb) / 2.0
        ensemble_test_prob = (test_prob_lgb + test_prob_xgb) / 2.0

        # Chercher le meilleur seuil pour l'ensemble sur le jeu de validation
        best_t_ensemble, best_val_metric_ensemble = search_best_threshold(y_val, ensemble_val_prob, df_val,
                                                                          min_trades_per_month=10)
        print(
            f"[Ensemble] Seuil optimal trouvé sur validation: {best_t_ensemble:.2f} (Precision: {best_val_metric_ensemble:.4f})")

        # Évaluer l'ensemble sur le jeu de test avec son propre seuil
        metrics_test_ensemble, y_pred_test_ensemble = evaluate_threshold(y_test, ensemble_test_prob,
                                                                         best_t_ensemble)
        cm_test_ensemble = confusion_matrix(y_test, y_pred_test_ensemble)


        ensemble_result = EvalResult(
            name="Ensemble (Moyenne)",
            threshold=best_t_ensemble, metrics_val={},
            metrics_test=metrics_test_ensemble,
            conf_matrix_test=cm_test_ensemble, extra={}
        )
        fold_results_list.append(ensemble_result)
        print("[Ensemble] Metrics test:", {k: round(v, 4) for k, v in metrics_test_ensemble.items()})
        dump_conf_matrix(cm_test_ensemble)

    all_results.extend(fold_results_list)

# --- Agrégation des résultats de la validation croisée ---
print(f"\n{'=' * 20} RÉSULTATS GLOBAUX (moyenne sur {N_SPLITS} plis) {'=' * 20}")
final_summary = {}
for res in all_results:
    if res.name not in final_summary:
        final_summary[res.name] = {'metrics_test': []}
    final_summary[res.name]['metrics_test'].append(res.metrics_test)

aggregated_results = []
for name, data in final_summary.items():
    df_metrics = pd.DataFrame(data['metrics_test'])
    mean_metrics = df_metrics.mean().to_dict()
    print(f"\n--- {name} ---")
    print(df_metrics.round(4))
    print("\nMoyenne:")
    print(pd.Series(mean_metrics).round(4))
    # On crée un EvalResult final avec les métriques moyennées
    aggregated_results.append(
        EvalResult(name=name, threshold=np.nan, metrics_val={}, metrics_test=mean_metrics, conf_matrix_test=None,
                   extra={}))

if not aggregated_results:
    raise SystemExit("Aucun modèle n'a pu être entraîné. Assurez-vous que LightGBM ou XGBoost est installé.")

# -------------------------------
# 8) Sélection du meilleur modèle (F1 sur validation), évaluation test détaillée
# -------------------------------
# --- NOUVELLE LOGIQUE DE SÉLECTION : Score combiné AUC et précision ---
print("\nSélection du meilleur modèle basée sur un score combiné AUC et précision sur un seul pli...")
print("Condition: Le recall doit être inférieur à 1.0 pour éviter les modèles dégénérés.")
print("NOTE: Cette méthode récompense la performance de pointe mais est moins robuste que la moyenne.")


if not all_results:
    raise SystemExit("Aucun résultat à évaluer. L'entraînement a probablement échoué.")

# On filtre les résultats où le recall est de 1.0, car ils indiquent un modèle qui prédit '1' pour tout.
valid_results = [r for r in all_results if r.metrics_test.get("recall", 0) < 1.0]

if not valid_results:
    print("\nAVERTISSEMENT : Tous les modèles ont un recall de 1.0. Aucun modèle valide n'a été trouvé selon les critères.")
    raise SystemExit("Aucun modèle non-dégénéré trouvé.")

    # Définition du score combiné (vous pouvez ajuster les poids)

def combined_score(res: EvalResult, auc_weight=0.6, precision_weight=0.4) -> float:
    auc = res.metrics_test.get("auc", 0)
    precision = res.metrics_test.get("precision", 0)
    score = (auc_weight * auc) + (precision_weight * precision)
    # On stocke le score pour l'afficher plus tard
    res.extra['combined_score'] = score
    return score

# On trie les résultats valides par le score combiné
all_results_sorted = sorted(valid_results, key=combined_score, reverse=True)

# Le meilleur est le premier de la liste
best_single_run = all_results_sorted[0]
best_model_type = best_single_run.name

print(f"Le meilleur run a été obtenu par '{best_single_run.name}' avec un score combiné de {best_single_run.extra.get('combined_score', 0):.4f}.")
print(f"  -> Détails: AUC={best_single_run.metrics_test.get('auc', 0):.4f}, Precision={best_single_run.metrics_test.get('precision', 0):.4f}, Recall={best_single_run.metrics_test.get('recall', 0):.4f}")

# --- PHASE 3: RÉ-ENTRAÎNEMENT DU MODÈLE FINAL POUR LE BACKTESTING ---
print("\n" + "=" * 20 + " PHASE 3: RÉ-ENTRAÎNEMENT DU MODÈLE FINAL " + "=" * 20)
print(f"Le meilleur type de modèle est '{best_model_type}'. Ré-entraînement sur 100% des données pour le backtesting...")

if "Ensemble" in best_model_type:
    print("Le modèle Ensemble ne peut pas être ré-entraîné directement. Veuillez utiliser les modèles individuels.")
else:
    # Utiliser les données complètes
    X_full, y_full = X, y

    # Pour l'early stopping, on utilise les 10% de données les plus récentes comme validation
    split_point = int(len(X_full) * 0.9)
    X_train_final, y_train_final = X_full[:split_point], y_full[:split_point]
    X_val_final, y_val_final = X_full[split_point:], y_full[split_point:]
    df_val_final = df.iloc[split_point:]

    print(
        f"Ré-entraînement sur {len(X_train_final)} échantillons, validation pour early stopping sur {len(X_val_final)}.")

    # Utiliser les hyperparamètres optimisés lors de la Phase 1
    if best_model_type == "LightGBM" and HAS_LGB:
        final_params = best_lgbm_params.copy()
        final_params.update({
            'objective': 'binary', 'metric': 'binary_logloss', 'verbosity': -1,
            'seed': RANDOM_STATE, 'n_estimators': 5000
        })
        pos_full = y_train_final.sum()
        neg_full = len(y_train_final) - pos_full
        final_params['scale_pos_weight'] = (neg_full / pos_full) if pos_full > 0 else 1.0

        final_model = lgb.LGBMClassifier(**final_params)
        final_model.fit(X_train_final, y_train_final, eval_set=[(X_val_final, y_val_final)],
                        callbacks=[lgb.early_stopping(200, verbose=False)])

        # Trouver le meilleur seuil pour ce modèle final
        final_val_prob = final_model.predict_proba(X_val_final)[:, 1]
        final_threshold, _ = search_best_threshold(y_val_final, final_val_prob, df_val_final, min_trades_per_month=10)

        # Sauvegarde du modèle final ET de son seuil
        final_model_path = os.path.join(OUTPUT_DIR, "final_model_lgbm.joblib")
        final_threshold_path = os.path.join(OUTPUT_DIR, "final_threshold_lgbm.json")
        joblib.dump(final_model, final_model_path)
        with open(final_threshold_path, "w") as f:
            json.dump({"threshold": float(final_threshold)}, f, indent=2)
        print(f"Modèle final pour backtest sauvegardé dans : {final_model_path}")
        print(f"Seuil final pour backtest sauvegardé dans : {final_threshold_path} (Seuil: {final_threshold:.4f})")

    elif best_model_type == "XGBoost" and HAS_XGB:
        final_params = best_xgb_params.copy()
        final_params.update({
            'objective': 'binary:logistic', 'eval_metric': 'logloss', 'tree_method': 'hist',
            'n_jobs': -1, 'random_state': RANDOM_STATE
        })
        pos_full = y_train_final.sum()
        neg_full = len(y_train_final) - pos_full
        final_params['scale_pos_weight'] = (neg_full / pos_full) if pos_full > 0 else 1.0

        final_model = XGBClassifier(n_estimators=5000, early_stopping_rounds=200, **final_params)
        final_model.fit(X_train_final, y_train_final, eval_set=[(X_val_final, y_val_final)], verbose=False)

        final_val_prob = final_model.predict_proba(X_val_final)[:, 1]
        final_threshold, _ = search_best_threshold(y_val_final, final_val_prob, df_val_final, min_trades_per_month=10)

        final_model_path = os.path.join(OUTPUT_DIR, "final_model_xgb.json")
        final_threshold_path = os.path.join(OUTPUT_DIR, "final_threshold_xgb.json")
        final_model.save_model(final_model_path)
        with open(final_threshold_path, "w") as f:
            json.dump({"threshold": float(final_threshold)}, f, indent=2)
        print(f"Modèle final pour backtest sauvegardé dans : {final_model_path}")
        print(f"Seuil final pour backtest sauvegardé dans : {final_threshold_path} (Seuil: {final_threshold:.4f})")

print("\n========================")
print(f"Meilleur modèle (basé sur le pic AUC): {best_single_run.name}")
print("\nPerformance de ce run spécifique:")
for k, v in best_single_run.metrics_test.items():
    print(f" - {k:<10}: {v:.4f}")
print("========================\n")

# Sauvegarde d'un récapitulatif JSON
# NOTE: Pour la sauvegarde finale du modèle pour MQL5, il faudrait le ré-entraîner sur TOUTES les données
 # en utilisant les meilleurs hyperparamètres trouvés. Cette partie est omise pour la simplicité de l'exemple.
 # Le résumé ici est basé sur les performances moyennes de la CV.

summary = {
    "best_model": best_single_run.name,
    "threshold": "N/A (Cross-Validation)", # Un seuil unique n'a pas de sens ici
    "val_metrics": {},
    "test_metrics": {k: float(v) for k, v in best_single_run.metrics_test.items()},
}
with open(os.path.join(OUTPUT_DIR, "summary_boosting.json"), "w") as f:
    json.dump(summary, f, indent=2)

# -------------------------------
# 9) (Optionnel) Affichage matrice de confusion du meilleur modèle
# -------------------------------
try:
    if best_single_run.conf_matrix_test is None:
        print("\nPas de matrice de confusion à afficher pour les résultats agrégés.")
    else:
        import seaborn as sns
        cm = best_single_run.conf_matrix_test
        plt.figure(figsize=(6,5))
        sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
                    xticklabels=['Perdant','Gagnant'], yticklabels=['Perdant','Gagnant'])
        plt.title(f"Matrice de confusion – {best_single_run.name}")
        plt.xlabel('Prédit')
        plt.ylabel('Vrai')
        fig_path = os.path.join(OUTPUT_DIR, f"cm_{best_single_run.name.lower()}.png")
        plt.tight_layout()
        plt.savefig(fig_path, dpi=130)
        plt.close() # Important pour fermer la figure et ne pas bloquer le script
        print(f"Matrice de confusion sauvegardée: {fig_path}")
except Exception as e:
    print("Impossible de tracer la matrice de confusion:", e)


print("\nNOTE: L'analyse d'erreur et les tests de filtres sont désactivés lors de l'utilisation de la validation croisée,")
print("car ils nécessiteraient d'être effectués à l'intérieur de chaque pli pour être valides.")

print("\nFini.")
