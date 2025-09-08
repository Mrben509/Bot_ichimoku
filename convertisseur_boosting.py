# -*- coding: utf-8 -*-
import os
import json
import sys
import numpy as np

# --- Vérification et importation des bibliothèques ---
# On s'assure que les outils nécessaires sont installés et on guide l'utilisateur si ce n'est pas le cas.
try:
    import joblib
    import m2cgen as m2c
    import lightgbm as lgb
    import xgboost as xgb
except ImportError as e:
    print(f"ERREUR: Bibliothèque manquante - {e.name}.")
    print("Veuillez l'installer avec la commande : pip install m2cgen lightgbm xgboost")
    sys.exit(1)

# --- 1. Configuration ---
# Chemins et constantes définis dans le script d'entraînement.
# Assurez-vous que ce chemin est correct.
OUTPUT_DIR = "Antrènan Bot Ichimoku/Antrènan Bot Ichimoku"
SUMMARY_PATH = os.path.join(OUTPUT_DIR, "summary_boosting.json")

# IMPORTANT : Cette liste de features doit correspondre EXACTEMENT à celle
# utilisée dans votre script d'entraînement `ml_XgBoost_&_LightGbm.py`.
FEATURES = [
    'type', 'rsiV', 'atrV', 'tenkan', 'kijun', 'spanA', 'spanB', 'lagging',
    'price', 'distPriceToCloud', 'distKijunToCloud', 'volume', 'sl', 'tp',
    'slope5V', 'slope10V', 'slope20V',
    'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V',
    'distance_to_sl_art', 'volatility_regime', 'prix_vs_ema200', 'rsi_vs_ema_rsi',
    'sl_size_in_atr'
]

# --- 2. Lire le résumé pour identifier le meilleur modèle ---
print("Lecture du fichier de résumé pour trouver le meilleur modèle...")
try:
    with open(SUMMARY_PATH, 'r', encoding='utf-8') as f:
        summary = json.load(f)
except FileNotFoundError:
    print(f"ERREUR: Fichier résumé introuvable : '{SUMMARY_PATH}'")
    print("Veuillez d'abord lancer le script 'ml_XgBoost_&_LightGbm.py'.")
    sys.exit(1)

best_model_name = summary.get('best_model')
best_threshold = summary.get('threshold')

if not best_model_name or best_threshold is None:
    print("ERREUR: Le fichier résumé est incomplet ou corrompu. Il manque 'best_model' ou 'threshold'.")
    sys.exit(1)

def generate_c_code_for_model(model, model_type_name):
    """Génère le code C pour un modèle, renomme la fonction et adapte la signature pour MQL5."""
    print(f"Génération du code C pour le modèle {model_type_name}...")
    code = m2c.exporters.export_to_c(model)
    function_name = f"{model_type_name}_score"
    code = code.replace("score", function_name)
    # Rendre la signature plus idiomatique pour MQL5 et éviter les conflits de noms
    code = code.replace("double * input", "const double &inputs[]")
    code = code.replace("input[", "inputs[")
    return code, function_name

def load_xgb_model(path):
    """Charge un modèle XGBoost et corrige le type de 'base_score' si nécessaire."""
    model = xgb.XGBClassifier()
    model.load_model(path)
    # CORRECTIF : m2cgen attend un float, mais il peut être chargé comme une chaîne.
    if hasattr(model, 'base_score') and isinstance(model.base_score, str):
        print(f"AVERTISSEMENT: Le 'base_score' du modèle XGBoost est une chaîne ('{model.base_score}'). Conversion en float.")
        try:
            model.base_score = float(model.base_score)
        except (ValueError, TypeError):
            print("ERREUR: Impossible de convertir 'base_score' en float.")
            sys.exit(1)
    return model

# --- 3. Charger et convertir le(s) modèle(s) ---
mqh_lines = []
final_predict_function = ""

# --- Header commun pour le fichier .mqh ---
mqh_header = [
    "//+------------------------------------------------------------------+",
    f"//|   {best_model_name} Predictor for MQL5",
    "//|   Généré par un script Python en utilisant m2cgen",
    "//+------------------------------------------------------------------+",
    "#property strict",
    "",
    f"// --- Seuil optimal trouvé pendant l'entraînement",
    f"const double BEST_THRESHOLD = {best_threshold:.6f};",
    "",
    "// --- Liste des features attendues par le modèle ---",
]
for i, feature in enumerate(FEATURES):
    mqh_header.append(f"// {i}: {feature}")
mqh_header.append("")

if "Ensemble" in best_model_name:
    print("Le meilleur modèle est un Ensemble. Conversion des deux modèles de base (LGBM et XGBoost)...")

    # Charger les deux modèles
    lgbm_model_file = os.path.join(OUTPUT_DIR, "lightgbm_model.joblib")
    xgb_model_file = os.path.join(OUTPUT_DIR, "xgb_model.json")

    try:
        model_lgbm = joblib.load(lgbm_model_file)
        model_xgb = load_xgb_model(xgb_model_file)
    except FileNotFoundError as e:
        print(f"ERREUR: Fichier modèle manquant pour l'ensemble : {e.filename}")
        print("Assurez-vous que les deux modèles 'lightgbm_model.joblib' et 'xgb_model.json' existent.")
        sys.exit(1)

    # Générer le code C pour chaque modèle
    c_code_lgbm, func_name_lgbm = generate_c_code_for_model(model_lgbm, "lightgbm")
    c_code_xgb, func_name_xgb = generate_c_code_for_model(model_xgb, "xgboost")

    # Assembler le fichier .mqh pour l'ensemble
    mqh_lines.extend(mqh_header)
    mqh_lines.extend([
        "// --- Code généré pour LightGBM ---",
        c_code_lgbm,
        "",
        "// --- Code généré pour XGBoost ---",
        c_code_xgb,
        "",
        "// --- Fonction Wrapper pour l'Ensemble ---",
        "// Retourne la moyenne des probabilités des deux modèles",
        "double Ensemble_Predict(const double &features[])",
        "{",
        "   double pred_lgbm[2];",
        "   double pred_xgb[2];",
        "",
        f"   {func_name_lgbm}(features, pred_lgbm);",
        f"   {func_name_xgb}(features, pred_xgb);",
        "",
        "   // Retourne la moyenne des probabilités de la classe 1 (Gagnant)",
        "   return (pred_lgbm[1] + pred_xgb[1]) / 2.0;",
        "}",
        "",
    ])
    final_predict_function = "Ensemble_Predict"

elif "LightGBM" in best_model_name or "XGBoost" in best_model_name:
    print(f"Le meilleur modèle identifié est : '{best_model_name}'")
    model_file = ""
    model_type = ""

    try:
        if "LightGBM" in best_model_name:
            model_file = os.path.join(OUTPUT_DIR, "lightgbm_model.joblib")
            model_type = "lightgbm"
            model_to_convert = joblib.load(model_file)
        elif "XGBoost" in best_model_name:
            model_file = os.path.join(OUTPUT_DIR, "xgb_model.json")
            model_type = "xgboost"
            model_to_convert = load_xgb_model(model_file)
    except FileNotFoundError:
        print(f"ERREUR: Fichier modèle introuvable : '{model_file}'")
        sys.exit(1)

    # Générer le code C
    c_code, function_name = generate_c_code_for_model(model_to_convert, model_type)

    # Assembler le fichier .mqh
    mqh_lines.extend(mqh_header)
    mqh_lines.extend([
        "// --- Code généré par m2cgen ---",
        c_code,
        "",
        "// --- Fonction Wrapper pour une utilisation simple dans MQL5 ---",
        f"// Retourne la probabilité de la classe 'Gagnant' (classe 1)",
        f"double {best_model_name.split(' ')[0]}_Predict(const double &features[])",
        "{",
        "   double prediction[2]; // Sortie pour la classe 0 et la classe 1",
        f"   {function_name}(features, prediction);",
        "   return prediction[1]; // Retourne la probabilité de la classe 1 (Gagnant)",
        "}",
        "",
    ])
    final_predict_function = f"{best_model_name.split(' ')[0]}_Predict"

else:
    print(f"ERREUR: Type de modèle inconnu ou non géré : '{best_model_name}'")
    sys.exit(1)

# --- 6. Écrire le fichier de sortie ---
output_mqh_path = os.path.join(OUTPUT_DIR, "boosting_model.mqh")
try:
    with open(output_mqh_path, "w", encoding="utf-8") as f:
        f.write("\n".join(mqh_lines))
    print(f"✅ Fichier '{output_mqh_path}' généré avec succès pour le modèle '{best_model_name}'.")
    print(f"   Utilisez la fonction '{final_predict_function}()' dans votre EA.")
    print(f"   Le seuil optimal de {best_threshold:.4f} est disponible via la constante BEST_THRESHOLD.")
except Exception as e:
    print(f"ERREUR: Impossible d'écrire le fichier de sortie : {e}")