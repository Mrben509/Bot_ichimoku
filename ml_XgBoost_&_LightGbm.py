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

# Tri temporel et sélection 1ère/dernière par ticket (comme ton script)
df = df.sort_values('timeInput').reset_index(drop=True)
first_entries = df.groupby('ticket', as_index=False).head(1)
last_entries = df.groupby('ticket', as_index=False).tail(1)
df = pd.concat([first_entries, last_entries]).drop_duplicates().reset_index(drop=True)

# Feature engineering identique
df['distance_to_sl_art'] = (df['price'] - df['sl']) / df['atrV']
df['volatility_regime'] = (df['priceStd20V'] > df['priceStd20V'].rolling(100, min_periods=1).mean()).astype(int)
df['prix_vs_ema200'] = (df['price'] - df['price'].rolling(200).mean()) / df['atrV']
df['rsi_vs_ema_rsi'] = df['rsiV'] - df['rsiV'].rolling(14).mean()
df['sl_size_in_atr'] = (df['price'] - df['sl']).abs() / df['atrV']

FEATURES = ['type', 'rsiV', 'atrV', 'tenkan', 'kijun', 'spanA', 'spanB', 'lagging',
            'price', 'distPriceToCloud', 'distKijunToCloud', 'volume', 'sl', 'tp',
            'slope5V', 'slope10V', 'slope20V',
            'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V',
            'distance_to_sl_art', 'volatility_regime', 'prix_vs_ema200', 'rsi_vs_ema_rsi',
            'sl_size_in_atr']

X = df[FEATURES].astype(np.float32).values
y = df['result'].astype(int).values

# -------------------------------
# 3) Split temporel 70/15/15
# -------------------------------
N = len(df)
train_end = int(0.70 * N)
val_end = int(0.85 * N)

X_train, y_train = X[:train_end], y[:train_end]
X_val,   y_val   = X[train_end:val_end], y[train_end:val_end]
X_test,  y_test  = X[val_end:], y[val_end:]

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

        preds_val = model.predict_proba(X_val)[:, 1]
        thresholds = np.arange(0.01, 1.0, 0.01)
        f1_scores = [f1_score(y_val, (preds_val >= t).astype(int), zero_division=0) for t in thresholds]
        return np.max(f1_scores)


    print("\n[LightGBM] Recherche des hyperparamètres avec optuna…")
    study = optuna.create_study(direction="maximize")
    study.optimize(objective_lgb, n_trials=50)  # Argumenten_trials pour meilleure recherche

    # 2. Entraînement final avec les meilleurs paramètres
    print("\n[LightGBMEntraînement final avec les meilleurs paramètres…]")
    best_params = study.best_params.copy()  # Copy pour évité de modifier l'objet de l'étude
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
    # On passe le dateframe de validation pour calculer la durée
    df_val_subset = df.iloc[train_end:val_end]
    best_t, best_val_metric = search_best_threshold(y_val, val_prob, df_val_subset, min_trades_per_month=10)

    # Sauvegarde
    model_path_txt = os.path.join(OUTPUT_DIR, "lightgbm_model.txt")
    model_path_joblib = os.path.join(OUTPUT_DIR, "lightgbm_model.joblib")
    model.booster_.save_model(model_path_txt)  # On garde le .txt pour référence
    joblib.dump(model, model_path_joblib)   # On sauvegarde l'objet compler pour la conversion
    print(f"[LightGBM] Modèle complet sauvegardé dans : {model_path_joblib}")
    with open(os.path.join(OUTPUT_DIR, "best_threshold_lgb.json"), "w") as f:
        json.dump({"threshold": float(best_t), "best_val_precision": float(best_val_metric)}, f, indent=2)

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

    print(f"\n[LightGBM] Seuil optimal (contrainte freq + max precision): {best_t:.2f} (Precision: {best_val_metric:.4f})")
    print("[LightGBM] Metrics test:", metrics_test)
    dump_conf_matrix(cm_test)

    return EvalResult(
        name="LightGBM",
        threshold=best_t,
        metrics_val=metrics_val,
        metrics_test=metrics_test,
        conf_matrix_test=cm_test,
        extra={"model_path": model_path_joblib}
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

        preds_val = model.predict_proba(X_val)[:, 1]
        thresholds = np.arange(0.01, 1.0, 0.01)
        f1_scores = [f1_score(y_val, (preds_val >= t).astype(int), zero_division=0) for t in thresholds]
        return np.max(f1_scores)

    print("\n[XGBoost] Recherche des hyperparamètres avec Optuna…")
    study = optuna.create_study(direction="maximize")
    study.optimize(objective_xgb, n_trials=50)   # Augmenter le n_trials pour une meilleurs recherche

    # 2. Entrainement final avec les meilleurs paramètres
    print("\n[XGBoost] Entraînement final avec les meilleurs paramètres…")
    best_params = study.best_params
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
    # On passe le dataframe de validation pour calculer la durée
    df_val_subset =df.iloc[train_end:val_end]
    best_t, best_val_metric = search_best_threshold(y_val, val_prob, df_val_subset, min_trades_per_month=10)

    # Sauvegarde
    model_path = os.path.join(OUTPUT_DIR, "xgb_model.json")
    model.save_model(model_path)
    with open(os.path.join(OUTPUT_DIR, "best_threshold_xgb.json"), "w") as f:
        json.dump({"threshold": float(best_t), "best_val_precision": float(best_val_metric)}, f, indent=2)

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

    print(f"\n[XGBoost] Seuil optimal (contrainte freq + max precision): {best_t:.2f} (Precision : {best_val_metric:.4f})")
    print("[XGBoost] Metrics test:", metrics_test)
    dump_conf_matrix(cm_test)

    return EvalResult(
        name="XGBoost",
        threshold=best_t,
        metrics_val=metrics_val,
        metrics_test=metrics_test,
        conf_matrix_test=cm_test,
        extra={"model_path": model_path}
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
    df_val_subset = df.iloc[train_end:val_end]
    best_t_ensemble, best_metric_ensemble_val = search_best_threshold(y_val, ensemble_val_prob, df_val_subset, min_trades_per_month=10)

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
        metrics_val={"precision": best_metric_ensemble_val}, # Simplifié pour le tri
        metrics_test=metrics_test_ensemble,
        conf_matrix_test=cm_test_ensemble,
        extra={}
    )
    results.append(ensemble_result)
    print(f"\n[Ensemble] Seuil optimal (contrainte freq + max precision): {best_t_ensemble:.2f} (Precision: {best_metric_ensemble_val:.4f})")
    print("[Ensemble] Metrics test:", metrics_test_ensemble)
    dump_conf_matrix(cm_test_ensemble)

if not results:
    raise SystemExit("Aucun modèle n'a pu être entraîné. Assurez-vous que LightGBM ou XGBoost est installé.")

# -------------------------------
# 8) Sélection du meilleur modèle (F1 sur validation), évaluation test détaillée
# -------------------------------
results = sorted(results, key=lambda r: r.metrics_val.get("precision", 0), reverse=True)
best = results[0]

print("\n========================")
print("Meilleur modèle:", best.name)
print("Seuil optimal (val F1):", round(best.threshold, 4))
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
    # 10) Analyse des erreurs sur le jeu de test
    # -------------------------------
print("\n--- Analyse des erreurs du meilleur modèle sur le jeu de test ---")

# Charger le meilleur modèle si ce n'est pas déjà fait
best_model_name = best.name
best_model = None
if "LightGBM" in best_model_name:
    best_model = models.get("LightGBM")
elif "XGBoost" in best_model_name:
    best_model = models.get("XGBoost")

if best_model:
    # Faire des prédictions sur le jeu de test
    test_probs = best_model.predict_proba(X_test)[:, 1]
    test_preds = (test_probs >= best.threshold).astype(int)

    # Créer un DataFrame d'analyse
    df_test_analysis = df.iloc[val_end:].copy()
    df_test_analysis['prediction'] = test_preds
    df_test_analysis['vrai_resultat'] = y_test

    # Isoler les erreurs
    faux_positifs = df_test_analysis[(df_test_analysis['prediction'] == 1) & (df_test_analysis['vrai_resultat'] == 0)]
    faux_negatifs = df_test_analysis[(df_test_analysis['prediction'] == 0) & (df_test_analysis['vrai_resultat'] == 1)]

    print(f"\nAnalyse de {len(faux_positifs)} Faux Positifs (trades perdants pris par le modèle):")
    # Afficher les statistiques des features clés pour ces erreurs
    print(faux_positifs[FEATURES].describe())

    print(f"\nAnalyse de {len(faux_negatifs)} Faux Négatifs (trades gagnants manqués par le modèle):")
    print(faux_negatifs[FEATURES].describe())

print("\nFini.")
