import pandas as pd
import numpy as np
import copy
import torch
import joblib
import os
import torch.nn as nn
from torch.backends.mkl import verbose
from torch.utils.data import Dataset, DataLoader
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import confusion_matrix, f1_score, precision_score, recall_score
import matplotlib.pyplot as plt
import seaborn as sns

# -------------------------------
# 1. Lecture et préparation CSV
# -------------------------------
file_path = "/home/emmanuel-raoul/newòn py/Antrènman_tès/N_XAUUSD_21_22.csv"

# crée le dossier de sortie s'il n'existe pas
output_dir = "Antrènan Bot Ichimoku"
os.makedirs(output_dir, exist_ok=True)
try:
    # On spécifie l'encodage pour éviter les problèmes de caractères cachés (BOM)
    df = pd.read_csv(file_path, sep=';', encoding='utf-8-sig')
except FileNotFoundError:
    print(f"ERREUR: Le fichier n'a pas été trouvé à l'emplacement : {file_path}")
    exit()

# --- ÉTAPE DE DÉBOGAGE ---
# 1. Afficher les colonnes EXACTEMENT comme pandas les lit
print("Colonnes lues depuis le CSV :")
print(list(df.columns))

# 2. Correction la plus courante : supprimer les espaces avant/après les noms
df.columns = df.columns.str.strip()
print("\nColonnes après nettoyage des espaces :")
print(list(df.columns))

# Assurons-nous que les colonnes importantes existent
required_columns = ['ticket', 'type', 'result', 'rsiV', 'atrV',
                    'tenkan', 'kijun', 'spanA', 'spanB', 'lagging',
                    'timeInput', 'timeOutput', 'price', 'distPriceToCloud',
                    'distKijunToCloud', 'volume', 'sl', 'tp', 'slope5V', 'slope10V', 'slope20V',
                    'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V']
for col in required_columns:
        if col not in df.columns:
            raise ValueError(f"La colonne {col} est manquante. Colonnes disponible : {list(df.columns)} dans le CSV")

# On garde la première et la dernière ligne pour chaque ticket
# On s'assure que es données sont trées par temps avant toute opération
df = df.sort_values('timeInput').reset_index(drop=True)
first_entries = df.sort_values('timeInput').groupby('ticket').head(1)
last_entries = df.sort_values('timeInput').groupby('ticket').tail(1)
df = pd.concat([first_entries, last_entries]).drop_duplicates().reset_index(drop=True)

# FEATURE ENGINEERING
# Ajout des features qui décrivent le risque et le contexte
df['distance_to_sl_art'] = (df['price'] - df['sl']) / df['atrV']
df['volatility_regime'] = (df['priceStd20V'] > df['priceStd20V'].rolling(100, min_periods=1).mean()).astype(int)
# Features et labels
features = ['type', 'rsiV', 'atrV', 'tenkan', 'kijun', 'spanA', 'spanB', 'lagging',
            'price', 'distPriceToCloud',
            'distKijunToCloud', 'volume', 'sl', 'tp', 'slope5V', 'slope10V', 'slope20V',
            'priceStd5V', 'priceStd10V', 'priceStd20V', 'zScore50V',
            'distance_to_sl_art', 'volatility_regime']
X = df[features].values.astype(np.float32)
y = df['result'].values.astype(np.float32)

# -------------------------------
# 2. Normalisation
# -------------------------------
scaler = StandardScaler()
X = scaler.fit_transform(X)
joblib.dump(scaler, os.path.join(output_dir, 'scaler.pkl'))
print(f"Scaler sauvegardé dans '{os.path.join(output_dir, 'scaler.pkl')}'")
# -------------------------------
# 3. Dataset PyTorch
# -------------------------------
class TradeDataset(Dataset):
    def __init__(self, X, y):
        self.X = torch.tensor(X, dtype=torch.float32)
        self.y = torch.tensor(y, dtype=torch.float32).unsqueeze(1)

    def __len__(self):
        return len(self.X)

    def __getitem__(self, idx):
        return self.X[idx], self.y[idx]


dataset = TradeDataset(X, y)

# VALIDATION TEMPORELLE (Suggestion #6)
# On remplace random_split par une séparation chronologique stricte
print(f"\nTotal samples: {len(dataset)}")
train_size = int(0.7 * len(dataset))
val_size = int(0.15 * len(dataset))
test_size = len(dataset) - train_size - val_size
print(f"Splitting info: Train={train_size}, Validation={val_size}, Test={test_size}")

train_dataset = torch.utils.data.Subset(dataset, range(train_size))
val_dataset = torch.utils.data.Subset(dataset, range(train_size, train_size + val_size))
test_dataset = torch.utils.data.Subset(dataset, range(train_size + val_size, len(dataset)))


train_loader = DataLoader(train_dataset, batch_size=16, shuffle=True, drop_last=True)
val_loader = DataLoader(val_dataset, batch_size=16, shuffle=False)
test_loader = DataLoader(test_dataset, batch_size=16, shuffle=False)


# -------------------------------
# 4. Définition du MLP
# -------------------------------
class MLP(nn.Module):
    def __init__(self, input_dim):
        super(MLP, self).__init__()
        # REGULARISATION (Suggestioin #9)
        # Ajout de BatchNorm at Dropout pour ameliorer la généralisation
        dropout_rate = 0.3
        self.model = nn.Sequential(
            nn.Linear(input_dim, 64),
            nn.BatchNorm1d(64),
            nn.ReLU(),
            nn.Dropout(dropout_rate),
            nn.Linear(64, 32),
            nn.BatchNorm1d(32),
            nn.ReLU(),
            nn.Dropout(dropout_rate),
            nn.Linear(32, 16),
            nn.ReLU(),
            nn.Linear(16, 1)
            # Nou retire sigmoid la pou nou itilize BCEWithLogitsLoss
        )

    def forward(self, x):
        return self.model(x)


device = torch.device("cpu")
model = MLP(X.shape[1]).to(device)

# -------------------------------
# 5. Entraînement
# -------------------------------
# Calcule du poids pour la classe positive (trades gagnants) pour géré le deséquilibre
pos_count = df['result'].sum()
neg_count = len(df) - pos_count
calculated_weight = neg_count / pos_count if pos_count > 0 else 1.0
# On réduit manuellement le poids pour rendre le modèle moins agressif
adjusted_weight = 1.2  # Valeur à tester (entre 1.5 et 2.2)
pos_weight = torch.tensor([adjusted_weight], device=device)
print(f"\nRatio de poids pour la classe positive (gagnants): {pos_weight.item():.2f}")

criterion = nn.BCEWithLogitsLoss(pos_weight=pos_weight)
# Ajout du weight_decay pour la regularisation (Suggestioin #9)
optimizer = torch.optim.Adam(model.parameters(), lr=0.0005, weight_decay=1e-5)
scheduler = torch.optim.lr_scheduler.ReduceLROnPlateau(optimizer, 'max', patience=5, factor=0.5)

num_epochs = 100 # On peut augmenter, l'early stopping s'en chargera
patience = 15
epochs_no_improve = 0
best_val_f1 = 0.0
best_model_state = None

for epoch in range(num_epochs):
    model.train()
    train_loss, train_correct, train_total = 0.0, 0, 0
    for inputs, labels in train_loader:
        inputs, labels = inputs.to(device), labels.to(device)
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()

        train_loss += loss.item() * inputs.size(0)
        preds = (torch.sigmoid(outputs) > 0.5).float() # On applique la sigmoid ici pour l'accuracy
        train_correct += (preds == labels).sum().item()
        train_total += labels.size(0)

    epoch_train_loss = train_loss / train_total
    epoch_train_acc = train_correct / train_total

    # Boucle de validation
    model.eval()
    val_loss = 0.0
    all_val_labels = []
    all_val_preds = []
    with torch.no_grad():
        for inputs, labels in val_loader:
            inputs, labels = inputs.to(device), labels.to(device)
            outputs = model(inputs)
            loss = criterion(outputs, labels)
            val_loss += loss.item() * inputs.size(0)

            preds = (torch.sigmoid(outputs) > 0.5).float()
            all_val_labels.extend(labels.cpu().numpy())
            all_val_preds.extend(preds.cpu().numpy())

    epoch_val_loss = val_loss / len(val_dataset)
    epoch_val_acc = (np.array(all_val_preds) == np.array(all_val_labels)).mean()
    # zero_division=0 évite les avertisements si le modèle ne presit aucune postion au début
    epoch_val_f1 = f1_score(all_val_labels, all_val_preds, zero_division=0)

    print(f"Epoch {epoch + 1}/{num_epochs} - Train Loss: {epoch_train_loss:.4f} - Train Acc: {epoch_train_acc:.4f} |"
          f"Val Loss: {epoch_val_loss:.4f}, Val Acc: {epoch_val_acc:.4f}, Val F1 - 0.5: {epoch_val_f1:.4f}")

    scheduler.step(epoch_val_f1)

    # Early Stopping et sauvegarde du meilleur modèle
    if epoch_val_f1 > best_val_f1:
        best_val_f1 = epoch_val_f1
        best_model_state = copy.deepcopy(model.state_dict())
        epochs_no_improve = 0
        print(f"Nouveau meilleur modèle trouvé ! (Val F1: {best_val_f1:.4f})")
    else:
        epochs_no_improve += 1

    if epochs_no_improve >= patience:
        print(f"Early stopping ! Pas d'amélioration depuis {patience} epochs.")
        break


# -------------------------------
# 6. Sauvegarde du modèle
# -------------------------------
if best_model_state:
    model.load_state_dict(best_model_state)
    print("\nMeilleur modèle chargé pour la sauvegarde.")

torch.save(model.state_dict(), os.path.join(output_dir, "mlp_trades.pt"))
# Export ONNX
dummy_input = torch.randn(1, X.shape[1])
torch.onnx.export(model, dummy_input, os.path.join(output_dir, "mlp_trades.onnx"),
                  input_names=['input'], output_names=['output'],
                  opset_version=12)
print(f"Modèle ONNX sauvegardé dans '{output_dir}/'")

# -------------------------------
# 7. Évaluation finale sur le set de test
# -------------------------------
model.eval()

# OPTIMISATIOIN DU SEUIL PAR PNL (Suggestion #1)
print("\n--- Recherche du seuil optimal pour maximiser le F1-score ---")

all_val_labels = []
all_val_probs = []
with torch.no_grad():
    for inputs, labels in val_loader:
        inputs, labels = inputs.to(device), labels.to(device)
        outputs = model(inputs)
        probs = torch.sigmoid(outputs)
        all_val_labels.extend(labels.cpu().numpy().flatten())
        all_val_probs.extend(probs.cpu().numpy().flatten())

# Teste une série de seuils pour trouver celuis qui maximise le F1-score
thresholds = np.arange(0.01, 1.0, 0.01)
f1_scores = [f1_score(all_val_labels, np.array(all_val_probs) >= t, zero_division=0) for t in thresholds]

best_threshold_idx = np.argmax(f1_scores)
best_threshold = thresholds[best_threshold_idx]
best_f1_score = f1_scores[best_threshold_idx]
print(f"Seuil optimal trouvé : {best_threshold:.4f}, F1-score: {best_f1_score:.4f}")

# Ensuite, évaluer sur le set de test avec ce seuil optimale
all_test_labels = []
all_test_preds = []
with torch.no_grad():
    for inputs, labels in test_loader:
        inputs, labels = inputs.to(device), labels.to(device)
        outputs = model(inputs)
        preds = (torch.sigmoid(outputs) > best_threshold).float()  # Utilisation du meilleur seuil
        all_test_labels.extend(labels.cpu().numpy().flatten())
        all_test_preds.extend(preds.cpu().numpy().flatten())


all_labels = np.array(all_test_labels)
all_preds = np.array(all_test_preds)

final_test_acc = (all_preds == all_labels).mean()
f1 = f1_score(all_labels, all_preds, zero_division=0)
precision = precision_score(all_labels, all_preds, zero_division=0)
recall = recall_score(all_labels, all_preds, zero_division=0)
conf_matrix = confusion_matrix(all_labels, all_preds)

print("\n--- Évaluation Finale sur le Set de Test ---")
print(f"Accuracy: {final_test_acc:.4f}")
print(f"precision: {precision:.4f}")
print(f"Recall (Sensibilité): {recall:.4f}")
print(f"F1-Score: {f1:.4f}")
print(f"\nMatrice de confusion (avec seuil optimisé à {best_threshold:.2f}) :")
print("                     Prédit Perdant | Prédit Gagnant")
print(f"Vrai Perdant :       {conf_matrix[0][0]:<12} | {conf_matrix[0][1]}")
print(f"Vrai Gagnant :       {conf_matrix[1][0]:<12} | {conf_matrix[1][1]}")

# Visualisation
plt.figure(figsize=(8, 6))
sns.heatmap(conf_matrix, annot=True, fmt='d', cmap='Blues',
            xticklabels=['Perdant', 'Gagnant'], yticklabels=['Perdant', 'Gagnant'])
plt.xlabel('Prédiction')
plt.ylabel('Vraie valeur')
plt.title('Matrice de Confusion')
plt.show()