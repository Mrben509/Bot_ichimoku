from __future__ import annotations

import threading
from datetime import datetime

import customtkinter as ctk

from companion.config import Settings
from companion.screen_capture import capture_monitor, list_monitors
from companion.vision_client import VisionClient


class CompanionApp(ctk.CTk):
    """Fenêtre flottante toujours au premier plan."""

    def __init__(self, settings: Settings) -> None:
        super().__init__()
        self.settings = settings
        self.client = VisionClient(settings)
        self.monitor_index = 1
        self._busy = False
        self._monitor_labels: list[str] = []

        ctk.set_appearance_mode("dark")
        ctk.set_default_color_theme("dark-blue")

        self.title(f"{settings.name} · Companion")
        self.geometry("380x560")
        self.minsize(340, 480)
        self.attributes("-topmost", True)

        self.configure(fg_color="#12161c")
        self._build()
        self.protocol("WM_DELETE_WINDOW", self._on_close)

        if not settings.has_api_key:
            self._append_system(
                "Configure ta clé API : copie desktop-companion/.env.example "
                "vers .env puis renseigne COMPANION_API_KEY."
            )
        else:
            self._append_assistant(
                f"Salut — je suis {settings.name}. "
                "Demande-moi ce que tu veux, ou clique « Regarde mon écran »."
            )

    def _build(self) -> None:
        accent = "#3ecf8e"
        muted = "#8b97a8"
        panel = "#1a212b"

        header = ctk.CTkFrame(self, fg_color="transparent")
        header.pack(fill="x", padx=16, pady=(16, 8))

        avatar = ctk.CTkLabel(
            header,
            text="◉",
            font=ctk.CTkFont(family="Segoe UI", size=28),
            text_color=accent,
            width=40,
        )
        avatar.pack(side="left")

        titles = ctk.CTkFrame(header, fg_color="transparent")
        titles.pack(side="left", fill="x", expand=True, padx=(8, 0))

        ctk.CTkLabel(
            titles,
            text=self.settings.name,
            font=ctk.CTkFont(family="Segoe UI Semibold", size=18),
            text_color="#f2f5f8",
            anchor="w",
        ).pack(fill="x")

        self.status_label = ctk.CTkLabel(
            titles,
            text="prêt · capture à la demande",
            font=ctk.CTkFont(family="Segoe UI", size=12),
            text_color=muted,
            anchor="w",
        )
        self.status_label.pack(fill="x")

        self.chat = ctk.CTkTextbox(
            self,
            fg_color=panel,
            text_color="#e8edf2",
            font=ctk.CTkFont(family="Segoe UI", size=13),
            wrap="word",
            activate_scrollbars=True,
        )
        self.chat.pack(fill="both", expand=True, padx=16, pady=8)
        self.chat.configure(state="disabled")

        actions = ctk.CTkFrame(self, fg_color="transparent")
        actions.pack(fill="x", padx=16, pady=(0, 8))

        self.look_btn = ctk.CTkButton(
            actions,
            text="Regarde mon écran",
            fg_color=accent,
            hover_color="#2fad74",
            text_color="#0b1210",
            font=ctk.CTkFont(family="Segoe UI Semibold", size=13),
            command=self._on_look,
            height=36,
        )
        self.look_btn.pack(side="left", fill="x", expand=True)

        self.clear_btn = ctk.CTkButton(
            actions,
            text="Effacer",
            fg_color="#2a3340",
            hover_color="#364152",
            text_color="#d7dee7",
            width=84,
            height=36,
            command=self._on_clear,
        )
        self.clear_btn.pack(side="left", padx=(8, 0))

        monitors = self._safe_list_monitors()
        choices: list[str] = []
        for m in monitors:
            label = "Tous les écrans" if m["index"] == 0 else f"Écran {m['index']}"
            choices.append(f"{label} ({m['width']}×{m['height']})")
        self._monitor_labels = choices
        default = choices[1] if len(choices) > 1 else (choices[0] if choices else "Écran 1")

        self.monitor_menu = ctk.CTkOptionMenu(
            self,
            values=choices or ["Écran 1"],
            command=self._on_monitor_change,
            fg_color="#2a3340",
            button_color="#364152",
            button_hover_color="#445163",
            dropdown_fg_color="#1a212b",
            height=30,
        )
        self.monitor_menu.set(default)
        self.monitor_menu.pack(fill="x", padx=16, pady=(0, 8))
        if len(choices) > 1:
            self.monitor_index = 1

        composer = ctk.CTkFrame(self, fg_color="transparent")
        composer.pack(fill="x", padx=16, pady=(0, 16))

        self.input = ctk.CTkEntry(
            composer,
            placeholder_text="Parle à ton companion…",
            fg_color=panel,
            border_color="#2f3948",
            text_color="#f2f5f8",
            height=38,
        )
        self.input.pack(side="left", fill="x", expand=True)
        self.input.bind("<Return>", lambda _e: self._on_send())

        self.send_btn = ctk.CTkButton(
            composer,
            text="Envoyer",
            width=90,
            height=38,
            fg_color="#3d7eff",
            hover_color="#2f66d1",
            command=self._on_send,
        )
        self.send_btn.pack(side="left", padx=(8, 0))

    @staticmethod
    def _safe_list_monitors() -> list[dict]:
        try:
            return list_monitors()
        except Exception:
            return [{"index": 1, "left": 0, "top": 0, "width": 1920, "height": 1080}]

    def _on_monitor_change(self, value: str) -> None:
        try:
            self.monitor_index = self._monitor_labels.index(value)
        except ValueError:
            self.monitor_index = 1

    def _on_clear(self) -> None:
        self.client.clear_history()
        self.chat.configure(state="normal")
        self.chat.delete("1.0", "end")
        self.chat.configure(state="disabled")
        self._append_system("Conversation effacée.")

    def _on_look(self) -> None:
        prompt = (
            "Regarde mon écran et dis-moi ce que tu vois d'important. "
            "Si une action semble utile, propose-la brièvement."
        )
        self._run_request(prompt, with_screen=True)

    def _on_send(self) -> None:
        text = self.input.get().strip()
        if not text:
            return
        self.input.delete(0, "end")
        wants_screen = any(
            key in text.lower()
            for key in ("écran", "ecran", "vois", "regarde", "screen", "capture")
        )
        self._run_request(text, with_screen=wants_screen)

    def _run_request(self, text: str, *, with_screen: bool) -> None:
        if self._busy:
            return
        self._busy = True
        self._set_status("réfléchit…")
        self._append_user(text)
        self._set_controls(False)

        def worker() -> None:
            try:
                image_b64 = None
                if with_screen:
                    capture = capture_monitor(self.monitor_index)
                    image_b64 = capture.as_jpeg_base64(
                        max_side=self.settings.max_image_side,
                        quality=self.settings.jpeg_quality,
                    )
                    self.after(
                        0,
                        lambda: self._set_status(
                            f"capture {capture.width}×{capture.height} · analyse…"
                        ),
                    )
                reply = self.client.ask(text, image_jpeg_b64=image_b64)
                self.after(0, lambda: self._finish_ok(reply))
            except Exception as exc:  # noqa: BLE001 — surface to UI
                message = str(exc)
                self.after(0, lambda: self._finish_err(message))

        threading.Thread(target=worker, daemon=True).start()

    def _finish_ok(self, reply: str) -> None:
        self._append_assistant(reply)
        self._set_status("prêt · capture à la demande")
        self._set_controls(True)
        self._busy = False

    def _finish_err(self, message: str) -> None:
        self._append_system(f"Erreur : {message}")
        self._set_status("erreur")
        self._set_controls(True)
        self._busy = False

    def _set_controls(self, enabled: bool) -> None:
        state = "normal" if enabled else "disabled"
        self.look_btn.configure(state=state)
        self.send_btn.configure(state=state)
        self.clear_btn.configure(state=state)
        self.input.configure(state=state)

    def _set_status(self, text: str) -> None:
        self.status_label.configure(text=text)

    def _append_user(self, text: str) -> None:
        self._append("Toi", text, "#9ec1ff")

    def _append_assistant(self, text: str) -> None:
        self._append(self.settings.name, text, "#3ecf8e")

    def _append_system(self, text: str) -> None:
        self._append("Système", text, "#c9a45c")

    def _append(self, who: str, text: str, color: str) -> None:
        stamp = datetime.now().strftime("%H:%M")
        self.chat.configure(state="normal")
        line_start = self.chat.index("end-1c")
        self.chat.insert("end", f"{who} · {stamp}\n")
        line_end = self.chat.index("end-1c")
        tag = f"who_{who}_{stamp}_{self.chat.index('end')}"
        self.chat.tag_add(tag, line_start, line_end)
        self.chat.tag_config(tag, foreground=color)
        self.chat.insert("end", f"{text}\n\n")
        self.chat.see("end")
        self.chat.configure(state="disabled")

    def _on_close(self) -> None:
        self.client.close()
        self.destroy()


def run_app(settings: Settings) -> None:
    app = CompanionApp(settings)
    app.mainloop()