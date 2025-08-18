import os
import json
import joblib
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
FILE_PATH = "/home/emmanuel-raoul/newòn py/Antrènman_tès/N_XAUUSD_21_22.csv"
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


def search_best_threshold(y_true, y_prob, metric="f1"):
    thresholds = np.arange(0.01, 1.00, 0.01)
    best_t, best_s = 0.5, -np.inf
    for t in thresholds:
        y_pred = (y_prob >= t).astype(int)
        if metric == "f1":
            s = f1_score(y_true, y_pred, zero_division=0)
        else:
            raise ValueError("Metric non supportée dans cette fonction")
        if s > best_s:
            best_s, best_t = s, t
    return best_t, best_s


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

    train_set = lgb.Dataset(X_train, label=y_train)
    val_set = lgb.Dataset(X_val, label=y_val)

    params = {
        "objective": "binary",
        "metric": "binary_logloss",            # Métrique pour l'early stopping
        "learning_rate": 0.02,
        "num_leaves": 64,
        "max_depth": -1,
        "min_data_in_leaf": 40,
        "feature_fraction": 0.9,
        "bagging_fraction": 0.8,
        "bagging_freq": 1,
        "lambda_l1": 0.0,
        "lambda_l2": 5.0,
        "verbosity": -1,
        "seed": RANDOM_STATE,
        "deterministic": True,
    }
    if scale_pos_weight is not None:
        params["scale_pos_weight"] = float(scale_pos_weight)

    print("\n[LightGBM] Entraînement…")
    model = lgb.train(
        params,
        train_set,
        num_boost_round=5000,
        valid_sets=[val_set],
        valid_names=["val"],
        callbacks=[
            lgb.early_stopping(stopping_rounds=200, verbose=False),
            lgb.log_evaluation(period=200)
        ],
    )

    # Probabilités validation & recherche seuil
    val_prob = model.predict(X_val, num_iteration=model.best_iteration)
    best_t, best_val_f1 = search_best_threshold(y_val, val_prob, metric="f1")

    # Sauvegarde
    model_path = os.path.join(OUTPUT_DIR, "lightgbm_model.txt")
    model.save_model(model_path)
    with open(os.path.join(OUTPUT_DIR, "best_threshold_lgb.json"), "w") as f:
        json.dump({"threshold": float(best_t), "best_val_f1": float(best_val_f1)}, f, indent=2)

    # Évaluation test
    test_prob = model.predict(X_test, num_iteration=model.best_iteration)
    metrics_val, _ = evaluate_threshold(y_val, val_prob, best_t)
    metrics_test, y_pred_test = evaluate_threshold(y_test, test_prob, best_t)
    cm_test = confusion_matrix(y_test, y_pred_test)

    # Importance des features
    imp_gain = model.feature_importance(importance_type='gain')
    imp_df = pd.DataFrame({'feature': FEATURES, 'gain': imp_gain})\
              .sort_values('gain', ascending=False).reset_index(drop=True)
    imp_df.to_csv(os.path.join(OUTPUT_DIR, 'lgb_feature_importance.csv'), index=False)

    print("\n[LightGBM] Seuil optimal (val F1):", best_t, best_val_f1)
    print("[LightGBM] Metrics test:", metrics_test)
    dump_conf_matrix(cm_test)

    return EvalResult(
        name="LightGBM",
        threshold=best_t,
        metrics_val=metrics_val,
        metrics_test=metrics_test,
        conf_matrix_test=cm_test,
        extra={"model_path": model_path}
    )

# -------------------------------
# 6) XGBoost
# -------------------------------
def train_xgboost(X_train, y_train, X_val, y_val, scale_pos_weight=None) -> EvalResult:
    if not HAS_XGB:
        raise RuntimeError("XGBoost introuvable dans l'environnement.")

    params = dict(
        n_estimators=5000,
        learning_rate=0.02,
        max_depth=6,
        subsample=0.8,
        colsample_bytree=0.9,
        reg_lambda=2.0,
        reg_alpha=0.0,
        min_child_weight=1.0,
        objective='binary:logistic',
        eval_metric='logloss',  # on optimisera le seuil via F1 ensuite
        tree_method='hist',
        n_jobs=-1,
        early_stopping_rounds=200,  # L'argument doit être ici
        random_state=RANDOM_STATE,
    )
    if scale_pos_weight is not None:
        params["scale_pos_weight"] = float(scale_pos_weight)

    print("\n[XGBoost] Entraînement…")
    model = XGBClassifier(**params)
    model.fit(
        X_train, y_train,
        eval_set=[(X_val, y_val)],
        verbose=False
    )

    # Probabilités validation & recherche seuil
    val_prob = model.predict_proba(X_val)[:, 1]
    best_t, best_val_f1 = search_best_threshold(y_val, val_prob, metric="f1")

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

    print("\n[XGBoost] Seuil optimal (val F1):", best_t, best_val_f1)
    print("[XGBoost] Metrics test:", metrics_test)
    dump_conf_matrix(cm_test)

    return EvalResult(
        name="XGBoost",
        threshold=best_t,
        metrics_val=metrics_val,
        metrics_test=metrics_test,
        conf_matrix_test=cm_test,
        extra={"model_path": model_path}
    )

# -------------------------------
# 7) Lancement: calcul du scale_pos_weight puis comparaison
# -------------------------------
pos = y_train.sum()
neg = len(y_train) - pos
scale_pos = (neg / pos) if pos > 0 else 1.0
print(f"\nClasses train → pos={int(pos)}, neg={int(neg)}, scale_pos_weight={scale_pos:.2f}")

results = []
if HAS_LGB:
    try:
        res_lgb = train_lightgbm(X_train, y_train, X_val, y_val, scale_pos_weight=scale_pos)
        results.append(res_lgb)
    except Exception as e:
        print("LightGBM a échoué:", e)

if HAS_XGB:
    try:
        res_xgb = train_xgboost(X_train, y_train, X_val, y_val, scale_pos_weight=scale_pos)
        results.append(res_xgb)
    except Exception as e:
        print("XGBoost a échoué:", e)

if not results:
    raise SystemExit("Aucun modèle n'a pu être entraîné. Assurez-vous que LightGBM ou XGBoost est installé.")

# -------------------------------
# 8) Sélection du meilleur modèle (F1 sur validation), évaluation test détaillée
# -------------------------------
results = sorted(results, key=lambda r: r.metrics_val["f1"], reverse=True)
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

print("\nFini.")
