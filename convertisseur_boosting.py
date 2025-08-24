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

# --- 3. Charger le modèle correspondant ---
model_file = ""
model_type = ""
model_to_convert = None

print(f"Le meilleur modèle identifié est : '{best_model_name}'")

if "LightGBM" in best_model_name:
    model_file = os.path.join(OUTPUT_DIR, "lightgbm_model.joblib")
    model_type = "lightgbm"


    model_to_convert = joblib.load(model_file)

elif "XGBoost" in best_model_name:
    model_file = os.path.join(OUTPUT_DIR, "xgb_model.json")
    model_type = "xgboost"
    # Pour XGBoost, il est préférable de charger l'objet modèle
    model_to_convert = xgb.XGBClassifier()
    model_to_convert.load_model(model_file)

    # CORRECTIF : m2cgen attend un float pour base_score, mais il peut être chargé comme une chaîne.
    # On s'assure qu'il est bien de type float avant la conversion.
    if hasattr(model_to_convert, 'base_score') and isinstance(model_to_convert.base_score, str):
        print(
            f"AVERTISSEMENT: Le 'base_score' du modèle XGBoost est une chaîne ('{model_to_convert.base_score}'). Conversion en float.")
        try:
            model_to_convert.base_score = float(model_to_convert.base_score)
        except (ValueError, TypeError):
            print("ERREUR: Impossible de convertir 'base_score' en float. Le modèle est peut-être corrompu.")
            sys.exit(1)

else:
    # On ne gère pas l'ensemble pour la conversion directe, car cela nécessiterait
    # de convertir les deux modèles et de combiner leur logique en MQL5.
    # On se concentre sur la conversion du meilleur modèle de base.
    print(f"AVERTISSEMENT: Le modèle '{best_model_name}' n'est pas directement convertible.")
    print("La conversion ne fonctionne que pour 'LightGBM' ou 'XGBoost' de base.")
    sys.exit(1)

if not os.path.exists(model_file):
    print(f"ERREUR: Fichier modèle introuvable : '{model_file}'")
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