from __future__ import annotations

import base64
import io
from dataclasses import dataclass

import mss
from PIL import Image


@dataclass(frozen=True)
class CaptureResult:
    png_bytes: bytes
    width: int
    height: int
    monitor_index: int

    def as_jpeg_base64(self, max_side: int = 1280, quality: int = 80) -> str:
        image = Image.open(io.BytesIO(self.png_bytes)).convert("RGB")
        image = _downscale(image, max_side=max_side)
        buffer = io.BytesIO()
        image.save(buffer, format="JPEG", quality=quality, optimize=True)
        return base64.b64encode(buffer.getvalue()).decode("ascii")


def list_monitors() -> list[dict]:
    with mss.mss() as sct:
        # index 0 = virtual all-monitors; 1..n = physical
        return [
            {
                "index": i,
                "left": m["left"],
                "top": m["top"],
                "width": m["width"],
                "height": m["height"],
            }
            for i, m in enumerate(sct.monitors)
        ]


def capture_monitor(monitor_index: int = 1) -> CaptureResult:
    with mss.mss() as sct:
        if monitor_index < 0 or monitor_index >= len(sct.monitors):
            raise ValueError(f"Moniteur invalide: {monitor_index}")
        monitor = sct.monitors[monitor_index]
        shot = sct.grab(monitor)
        image = Image.frombytes("RGB", shot.size, shot.rgb)
        buffer = io.BytesIO()
        image.save(buffer, format="PNG")
        return CaptureResult(
            png_bytes=buffer.getvalue(),
            width=image.width,
            height=image.height,
            monitor_index=monitor_index,
        )


def _downscale(image: Image.Image, max_side: int) -> Image.Image:
    w, h = image.size
    longest = max(w, h)
    if longest <= max_side:
        return image
    scale = max_side / float(longest)
    new_size = (max(1, int(w * scale)), max(1, int(h * scale)))
    return image.resize(new_size, Image.Resampling.LANCZOS)