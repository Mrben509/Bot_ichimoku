from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any

import httpx

from companion.config import Settings


@dataclass
class ChatMessage:
    role: str
    content: str


@dataclass
class VisionClient:
    settings: Settings
    history: list[ChatMessage] = field(default_factory=list)
    _client: httpx.Client | None = field(default=None, init=False, repr=False)

    def __post_init__(self) -> None:
        self._client = httpx.Client(timeout=90.0)

    def close(self) -> None:
        if self._client is not None:
            self._client.close()
            self._client = None

    def clear_history(self) -> None:
        self.history.clear()

    def system_prompt(self) -> str:
        lang = self.settings.language
        name = self.settings.name
        if lang.lower().startswith("fr"):
            return (
                f"Tu es {name}, un companion de bureau amical, concis et utile. "
                "Tu peux voir des captures d'écran fournies par l'utilisateur. "
                "Décris clairement ce que tu vois, aide à comprendre l'interface, "
                "réponds aux questions, et propose des prochaines étapes concrètes. "
                "Ne fabrique pas de détails invisibles. Reste bref sauf si on te demande plus. "
                "Tu réponds toujours en français."
            )
        return (
            f"You are {name}, a friendly, concise desktop companion. "
            "You can see screenshots provided by the user. Describe what you see, "
            "help with the UI, answer questions, and suggest concrete next steps. "
            "Do not invent unseen details. Keep answers short unless asked for more."
        )

    def ask(
        self,
        user_text: str,
        *,
        image_jpeg_b64: str | None = None,
    ) -> str:
        if not self.settings.has_api_key:
            raise RuntimeError(
                "Aucune clé API. Copie .env.example vers .env et renseigne COMPANION_API_KEY."
            )

        content: list[dict[str, Any]] = [{"type": "text", "text": user_text}]
        if image_jpeg_b64:
            content.append(
                {
                    "type": "image_url",
                    "image_url": {
                        "url": f"data:image/jpeg;base64,{image_jpeg_b64}",
                        "detail": "low",
                    },
                }
            )

        messages: list[dict[str, Any]] = [
            {"role": "system", "content": self.system_prompt()},
        ]
        for item in self.history[-12:]:
            messages.append({"role": item.role, "content": item.content})
        messages.append({"role": "user", "content": content})

        assert self._client is not None
        response = self._client.post(
            f"{self.settings.base_url}/chat/completions",
            headers={
                "Authorization": f"Bearer {self.settings.api_key}",
                "Content-Type": "application/json",
            },
            json={
                "model": self.settings.model,
                "messages": messages,
                "temperature": 0.4,
            },
        )
        if response.status_code >= 400:
            detail = response.text[:500]
            raise RuntimeError(f"API vision erreur {response.status_code}: {detail}")

        data = response.json()
        try:
            reply = data["choices"][0]["message"]["content"]
        except (KeyError, IndexError, TypeError) as exc:
            raise RuntimeError(f"Réponse API inattendue: {data}") from exc

        reply = (reply or "").strip()
        self.history.append(ChatMessage(role="user", content=user_text))
        self.history.append(ChatMessage(role="assistant", content=reply))
        return reply