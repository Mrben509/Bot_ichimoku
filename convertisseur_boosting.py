# -*- coding: utf-8 -*-
import os
import json
import sys
# --- Augmenter la limite de récursion ---
# Les modèles complexes (notamment XGBoost) peuvent dépasser la limite par défaut lors de la conversion.
sys.setrecursionlimit(10000)
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
FEATURES = ['type', 'rsiV', 'atrV', 'tenkan', 'kijun', 'spanA', 'spanB', 'lagging', 'price',
            'distPriceToCloud', 'distKijunToCloud', 'volume', 'sl', 'tp', 'slope5V', 'slope10V', 'slope20V',
            'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V',
            'distance_to_sl_art', 'volatility_regime', 'prix_vs_ema200', 'rsi_vs_ema_rsi',
            'sl_size_in_atr']

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


def load_threshold(threshold_file):
    """Charge le seuil depuis son fichier JSON dédié."""
    try:
        with open(threshold_file, 'r') as f:
            threshold_data = json.load(f)
            threshold = threshold_data.get('threshold')
        if threshold is None:
            raise KeyError("La clé 'threshold' est manquante.")
        print(f"Seuil chargé depuis '{threshold_file}': {threshold:.4f}")
        return threshold
    except (FileNotFoundError, KeyError, json.JSONDecodeError) as e:
        print(f"ERREUR: Fichier seuil '{threshold_file}' introuvable ou invalide. Erreur: {e}")
        sys.exit(1)


def generate_c_code(model, model_type):
    """Génère et formate le code C pour un modèle donné."""
    print(f"Génération du code C pour le modèle {model_type}...")
    code = m2c.exporters.export_to_c(model)
    function_name = f"{model_type}_score"
    code = code.replace("score", function_name)
    code = code.replace("input[", "inputs[")
    code = code.replace("double * input", "const double &inputs[]")
    return code, function_name


def generate_wrapper(model_name, function_name):
    """Génère la fonction wrapper MQL5 pour un modèle unique."""
    return [
        f"// Retourne la probabilité de la classe 'Gagnant' (classe 1) pour {model_name}",
        f"double {model_name}_Predict(const double &inputs[])",
        "{",
        "   double prediction[2];",
        f"   {function_name}(inputs, prediction);",
        "   return prediction[1];",
        "}",
    ]


if "Ensemble" in best_model_name:
    print("Le meilleur modèle est un Ensemble. Conversion des deux modèles de base (LGBM et XGBoost)...")

    # Charger les deux modèles
    lgbm_file = os.path.join(OUTPUT_DIR, "final_model_lgbm.joblib")
    xgb_file = os.path.join(OUTPUT_DIR, "final_model_xgb.json")

    model_lgbm = joblib.load(lgbm_file)
    model_xgb = xgb.XGBClassifier()
    model_xgb.load_model(xgb_file)

    # CORRECTIF: s'assurer que base_score est un float pour XGBoost
    if hasattr(model_xgb, 'base_score') and isinstance(model_xgb.base_score, str):
        print("AVERTISSEMENT: Le 'base_score' du modèle XGBoost est une chaîne. Conversion en float.")
        try:
            model_xgb.base_score = float(model_xgb.base_score)
        except (ValueError, TypeError):
            print("ERREUR: Impossible de convertir 'base_score' en float.")
            sys.exit(1)

    # Charger le seuil de l'ensemble
    threshold_file = os.path.join(OUTPUT_DIR, "final_threshold_ensemble.json")
    best_threshold = load_threshold(threshold_file)

    # Générer le code C pour chaque modèle
    c_code_lgbm, func_name_lgbm = generate_c_code(model_lgbm, "lightgbm")
    c_code_xgb, func_name_xgb = generate_c_code(model_xgb, "xgboost")

    # Assembler le fichier .mqh
    mqh_lines = [
        "//+------------------------------------------------------------------+",
        f"//|   {best_model_name} Predictor for MQL5",
        "//+------------------------------------------------------------------+",
        "#property strict", "",
        f"const double BEST_THRESHOLD = {best_threshold:.6f};", ""
    ]
    mqh_lines.append("// --- Liste des features attendues par les modèles ---")
    for i, feature in enumerate(FEATURES):
        mqh_lines.append(f"// {i}: {feature}")

    mqh_lines.extend(["", "// --- Code généré pour LightGBM ---", c_code_lgbm])
    mqh_lines.extend(["", "// --- Code généré pour XGBoost ---", c_code_xgb])

    # Créer le wrapper final pour l'ensemble
    mqh_lines.extend([
        "",
        "// --- Fonction Wrapper pour l'Ensemble ---",
        "// Retourne la moyenne des probabilités des deux modèles",
        "double Ensemble_Predict(const double &inputs[])",
        "{",
        "   double pred_lgbm[2];",
        "   double pred_xgb[2];",
        "",
        f"   {func_name_lgbm}(inputs, pred_lgbm);",
        f"   {func_name_xgb}(inputs, pred_xgb);",
        "",
        "   // Retourne la moyenne des probabilités de la classe 1 (Gagnant)",
        "   return (pred_lgbm[1] + pred_xgb[1]) / 2.0;",
        "}",
    ])
    final_predict_function = "Ensemble_Predict"

else:  # Si c'est un modèle unique
    print(f"Le meilleur modèle est un modèle unique: '{best_model_name}'")
    model_to_convert = None
    model_type = ""

    if "LightGBM" in best_model_name:
        model_file = os.path.join(OUTPUT_DIR, "final_model_lgbm.joblib")
        threshold_file = os.path.join(OUTPUT_DIR, "final_threshold_lgbm.json")
        model_type = "lightgbm"
        model_to_convert = joblib.load(model_file)
    elif "XGBoost" in best_model_name:
        model_file = os.path.join(OUTPUT_DIR, "final_model_xgb.json")
        threshold_file = os.path.join(OUTPUT_DIR, "final_threshold_xgb.json")
        model_type = "xgboost"
        model_to_convert = xgb.XGBClassifier()
        model_to_convert.load_model(model_file)

        # CORRECTIF: s'assurer que base_score est un float pour XGBoost
        if hasattr(model_to_convert, 'base_score') and isinstance(model_to_convert.base_score, str):
            print("AVERTISSEMENT: Le 'base_score' du modèle XGBoost est une chaîne. Conversion en float.")
            try:
                model_to_convert.base_score = float(model_to_convert.base_score)
            except (ValueError, TypeError):
                print("ERREUR: Impossible de convertir 'base_score' en float.")
                sys.exit(1)

    best_threshold = load_threshold(threshold_file)
    c_code, function_name = generate_c_code(model_to_convert, model_type)

    mqh_lines = [
        "//+------------------------------------------------------------------+",
        f"//|   {best_model_name} Predictor for MQL5",
        "//+------------------------------------------------------------------+",
        "#property strict", "",
        f"const double BEST_THRESHOLD = {best_threshold:.6f};", ""
    ]
    mqh_lines.append("// --- Liste des features attendues par le modèle ---")
    for i, feature in enumerate(FEATURES):
        mqh_lines.append(f"// {i}: {feature}")

    mqh_lines.extend(["", "// --- Code généré par m2cgen ---", c_code])
    mqh_lines.extend(["", "// --- Fonction Wrapper pour une utilisation simple ---"])
    mqh_lines.extend(generate_wrapper(best_model_name.split(' ')[0], function_name))
    final_predict_function = f"{best_model_name.split(' ')[0]}_Predict"

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