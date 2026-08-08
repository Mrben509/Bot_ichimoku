# Desktop Companion (Lumen)

Companion de bureau flottant qui **voit ton écran à la demande** et discute avec toi via un modèle vision (OpenAI ou API compatible).

## Ce qu’il fait

- Fenêtre toujours au premier plan
- Bouton **Regarde mon écran** → capture + analyse
- Chat libre ; si tu dis « regarde / écran / vois », une capture part avec le message
- Choix du moniteur
- Historique de conversation (effaçable)
- Capture **uniquement à la demande** (pas de streaming permanent)

## Prérequis

- Python 3.10+
- Une clé API avec un modèle vision (`gpt-4o-mini`, `gpt-4o`, etc.)
- Sur Linux : serveur X11/Wayland avec droits de capture d’écran

## Installation

```bash
cd desktop-companion
python3 -m venv .venv
source .venv/bin/activate   # Windows: .venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env
```

Édite `.env` :

```env
COMPANION_API_KEY=sk-...
COMPANION_MODEL=gpt-4o-mini
COMPANION_NAME=Lumen
```

## Lancer

Depuis le dossier `desktop-companion` :

```bash
python -m companion
```

## Vie privée

- Aucune capture n’est envoyée tant que tu n’as pas cliqué **Regarde mon écran** ou demandé explicitement de regarder.
- L’image est redimensionnée puis envoyée à l’API configurée (`COMPANION_BASE_URL`).
- Pas de stockage local des captures.

## Tests

```bash
pytest -q
```

## Limites actuelles (MVP)

- Pas de contrôle souris/clavier (observation + conseils seulement)
- Pas d’avatar animé / overlay transparent avancé
- Dépend d’une API vision externe (ou endpoint compatible OpenAI)

Prochaines étapes possibles : mode « veille » avec intervalle, OCR local, actions GUI avec confirmation, avatar animé.