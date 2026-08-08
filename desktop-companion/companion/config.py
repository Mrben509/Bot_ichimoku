from __future__ import annotations

import os
from dataclasses import dataclass
from pathlib import Path

from dotenv import load_dotenv

ROOT = Path(__file__).resolve().parent.parent
load_dotenv(ROOT / ".env")


@dataclass(frozen=True)
class Settings:
    api_key: str
    base_url: str
    model: str
    name: str
    language: str
    max_image_side: int = 1280
    jpeg_quality: int = 80

    @property
    def has_api_key(self) -> bool:
        return bool(self.api_key.strip())


def load_settings() -> Settings:
    return Settings(
        api_key=os.getenv("COMPANION_API_KEY", "").strip(),
        base_url=os.getenv("COMPANION_BASE_URL", "https://api.openai.com/v1").rstrip("/"),
        model=os.getenv("COMPANION_MODEL", "gpt-4o-mini").strip() or "gpt-4o-mini",
        name=os.getenv("COMPANION_NAME", "Lumen").strip() or "Lumen",
        language=os.getenv("COMPANION_LANGUAGE", "fr").strip() or "fr",
    )