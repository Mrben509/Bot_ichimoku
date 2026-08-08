from __future__ import annotations

from companion.config import load_settings
from companion.ui import run_app


def main() -> None:
    settings = load_settings()
    run_app(settings)


if __name__ == "__main__":
    main()