import torch
import joblib
import numpy as np

# --- Charger le modèle PyTorch ---
class MLP(torch.nn.Module):
    def __init__(self, input_dim):
        super(MLP, self).__init__()
        self.model = torch.nn.Sequential(
            torch.nn.Linear(input_dim, 64),
            torch.nn.ReLU(),
            torch.nn.Linear(64, 32),
            torch.nn.ReLU(),
            torch.nn.Linear(32, 16),
            torch.nn.ReLU(),
            torch.nn.Linear(16, 1)
        )
    def forward(self, x):
        return self.model(x)

input_dim = 14
model = MLP(input_dim)
model.load_state_dict(torch.load("mlp_trades_I.pt", map_location="cpu"))
model.eval()

# --- Charger le scaler ---
scaler = joblib.load("scalers.pkl")
means = scaler.mean_
stds = scaler.scale_

# --- Extraire les poids & biais ---
params = {}
i = 1
for layer in model.model:
    if isinstance(layer, torch.nn.Linear):
        params[f"W{i}"] = layer.weight.detach().numpy()
        params[f"b{i}"] = layer.bias.detach().numpy()
        i += 1

# --- Génération du fichier MQL5 ---
mqh_lines = []
mqh_lines.append("//+------------------------------------------------------------------+")
mqh_lines.append("//|   MLP Trades avec normalisation intégrée                        |")
mqh_lines.append("//|   Généré depuis PyTorch                                          |")
mqh_lines.append("//+------------------------------------------------------------------+")
mqh_lines.append("#property strict")
mqh_lines.append("")
mqh_lines.append("double relu(double x) { return MathMax(0.0, x); }")
mqh_lines.append("double sigmoid(double x) { return 1.0 / (1.0 + MathExp(-x)); }")
mqh_lines.append("")
# --- Moyennes & écarts-types ---
mqh_lines.append("// Moyennes pour normalisation")
mqh_lines.append(f"double means[{input_dim}] = {{ {', '.join(f'{m:.10f}' for m in means)} }};")
mqh_lines.append("// Écarts-types pour normalisation")
mqh_lines.append(f"double stds[{input_dim}] = {{ {', '.join(f'{s:.10f}' for s in stds)} }};")
mqh_lines.append("")

# --- Fonction principale ---
mqh_lines.append("double MLP_PredictRaw(const double &raw_input[])")
mqh_lines.append("{")
mqh_lines.append(f"   double input[{input_dim}];")
mqh_lines.append(f"   for(int i=0; i<{input_dim}; i++)")
mqh_lines.append(f"       input[i] = (raw_input[i] - means[i]) / stds[i];")
mqh_lines.append("")

num_linear_layers = len(params) // 2
layer_input = "inputs"
for i in range(1, num_linear_layers + 1):
    W = params[f"W{i}"]
    b = params[f"b{i}"]
    out_size = W.shape[0]
    in_size = W.shape[1]
    mqh_lines.append(f"   double layer{i}[{out_size}];")
    for o in range(out_size):
        weights_str = ", ".join([f"{W[o][j]:.10f}" for j in range(in_size)])
        mqh_lines.append(f"   double W{i}_{o}[] = {{ {weights_str} }};")
        mqh_lines.append(f"   double sum_{i}_{o} = 0.0;")
        mqh_lines.append(f"   for(int j=0; j<{in_size}; j++) sum_{i}_{o} += {layer_input}[j] * W{i}_{o}[j];")
        mqh_lines.append(f"   sum_{i}_{o} += {b[o]:.10f};")
        if i < num_linear_layers:
            mqh_lines.append(f"   layer{i}[{o}] = relu(sum_{i}_{o});")
        else:
            mqh_lines.append(f"   layer{i}[{o}] = sigmoid(sum_{i}_{o});")
    layer_input = f"layer{i}"

mqh_lines.append(f"   return layer{num_linear_layers}[0];")
mqh_lines.append("}")

# --- Écriture du fichier ---
with open("mlp_trades_I.mqh", "w", encoding="utf-8") as f:
    f.write("\n".join(mqh_lines))

print("✅ Fichier 'mlp_trades_I.mqh' généré avec succès (normalisation incluse)")
