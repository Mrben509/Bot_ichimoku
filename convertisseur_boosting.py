# -*- coding: utf-8 -*-
import os
import json
import sys

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
FEATURES = ['type', 'rsiV', 'atrV', 'zScore50V',
            'distance_to_sl_art', 'volatility_regime', 'prix_vs_ema200', 'rsi_vs_ema_rsi',
            'risk_reward_ratio', 'ADX_14', 'cloud_thickness', 'tk_cross_signal',
            'tenkan_slope', 'kijun_slope', 'atr_relative', 'price_vs_kijun', 'dist_from_spanA',
            'dist_from_spanB', 'tk_cross_strength', 'tk_cross_stability', 'hour_of_day',
            'rsi_stability', 'adx_trend_strength', 'cross_x_adx', 'kijun_x_rsi_stab']

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

try:
    if "LightGBM" in best_model_name:
        model_file = os.path.join(OUTPUT_DIR, "final_model_lgbm.joblib")
        threshold_file = os.path.join(OUTPUT_DIR, "final_threshold_lgbm.json")
        model_type = "lightgbm"
        print(f"Chargement du modèle depuis : {model_file}")
        model_to_convert = joblib.load(model_file)

    elif "XGBoost" in best_model_name:
        model_file = os.path.join(OUTPUT_DIR, "final_model_xgb.json")
        threshold_file = os.path.join(OUTPUT_DIR, "final_threshold_xgb.json")
        model_type = "xgboost"
        print(f"Chargement du modèle depuis : {model_file}")
        model_to_convert = xgb.XGBClassifier()
        model_to_convert.load_model(model_file)

        # m2cgen attend un float pour base_score, mais il peut être chargé comme une chaîne.
        if hasattr(model_to_convert, 'base_score') and isinstance(model_to_convert.base_score, str):
            print(
                f"AVERTISSEMENT: Le 'base_score' du modèle XGBoost est une chaîne ('{model_to_convert.base_score}'). Conversion en float.")
            try:
                model_to_convert.base_score = float(model_to_convert.base_score)
            except (ValueError, TypeError):
                print("ERREUR: Impossible de convertir 'base_score' en float. Le modèle est peut-être corrompu.")
                sys.exit(1)
    else:
        # On ne gère pas l'ensemble pour la conversion directe.
        print(f"AVERTISSEMENT: Le modèle '{best_model_name}' n'est pas directement convertible.")
        print("La conversion ne fonctionne que pour 'LightGBM' ou 'XGBoost' de base.")
        sys.exit(1)

except FileNotFoundError:
    print(f"ERREUR: Fichier modèle introuvable : '{model_file}'")
    print("Assurez-vous que la phase de ré-entraînement (Phase 3) du script principal a bien été exécutée.")
    sys.exit(1)
except Exception as e:
    print(f"ERREUR: Une erreur inattendue est survenue lors du chargement du modèle : {e}")
    sys.exit(1)

    # Charger le seuil depuis son fichier dédié pour plus de robustesse
try:
    with open(threshold_file, 'r') as f:
        threshold_data = json.load(f)
        best_threshold = threshold_data.get('threshold')
    if best_threshold is None:
        raise KeyError("La clé 'threshold' est manquante dans le fichier.")
    print(f"Seuil chargé depuis '{threshold_file}': {best_threshold:.4f}")
except (FileNotFoundError, KeyError, json.JSONDecodeError) as e:
    print(f"ERREUR: Fichier seuil '{threshold_file}' introuvable ou invalide. Erreur: {e}")
    print("Assurez-vous que la phase de ré-entraînement (Phase 3) du script principal a bien été exécutée.")
    sys.exit(1)

# --- 4. Générer le code C avec m2cgen ---
print("Génération du code MQL5 avec m2cgen...")
# On génère du code C, qui est très compatible avec MQL5.
# La fonction générée prend un tableau de features en entrée et place le résultat (probabilités) dans un tableau de sortie.
c_code = m2c.exporters.export_to_c(model_to_convert)

# --- 5. Assembler le fichier .mqh ---
# Rendre le code généré plus spécifique pour éviter les conflits de noms dans MQL5
function_name = f"{model_type}_score"
c_code = c_code.replace("score", function_name)

# Remplacer le nom du paramètre d'entrée pour éviter les conflits de mots-clés
# et utiliser la syntaxe de passage par référence idiomatique de MQL5.
c_code = c_code.replace("input[", "inputs[")
c_code = c_code.replace("double * input", "const double &inputs[]")

# On assemble toutes les parties du fichier .mqh
mqh_lines = [
    "//+------------------------------------------------------------------+",
    f"//|   {best_model_name} Predictor for MQL5",
    "//|   Généré par un script Python en utilisant m2cgen",
    "//+------------------------------------------------------------------+",
    "#property strict",
    "",
    f"// --- Seuil optimal trouvé pendant l'entraînement (basé sur des contraintes de performance: fréquence et précision)",
    f"const double BEST_THRESHOLD = {best_threshold:.6f};",
    "",
    "// --- Liste des features attendues par le modèle ---",
]
# On ajoute la liste des features en commentaire pour faciliter le débogage dans MQL5
for i, feature in enumerate(FEATURES):
    mqh_lines.append(f"// {i}: {feature}")

# On ajoute le code du modèle et une fonction "wrapper" pour simplifier son appel
mqh_lines.extend([
    "",
    "// --- Code généré par m2cgen ---",
    c_code,
    "",
    "// --- Fonction Wrapper pour une utilisation simple dans MQL5 ---",
    f"// Retourne la probabilité de la classe 'Gagnant' (classe 1)",
    f"double {best_model_name.split(' ')[0]}_Predict(const double &inputs[])",
    "{",
    "   double prediction[2]; // Sortie pour la classe 0 et la classe 1",
    f"   {function_name}(inputs, prediction);",
    "   return prediction[1]; // Retourne la probabilité de la classe 1 (Gagnant)",
    "}",
    "",
])

# --- 6. Écrire le fichier de sortie ---
output_mqh_path = os.path.join(OUTPUT_DIR, "boosting_model.mqh")
try:
    with open(output_mqh_path, "w", encoding="utf-8") as f:
        f.write("\n".join(mqh_lines))
    print(f"✅ Fichier '{output_mqh_path}' généré avec succès pour le modèle '{best_model_name}'.")
    print(f"   Utilisez la fonction '{best_model_name.split(' ')[0]}_Predict()' dans votre EA.")
    print(f"   Le seuil optimal de {best_threshold:.4f} est disponible via la constante BEST_THRESHOLD.")
except Exception as e:
    print(f"ERREUR: Impossible d'écrire le fichier de sortie : {e}")