import base64
import io

from PIL import Image

from companion.screen_capture import CaptureResult, _downscale


def test_downscale_keeps_small_image() -> None:
    img = Image.new("RGB", (800, 600), color=(10, 20, 30))
    out = _downscale(img, max_side=1280)
    assert out.size == (800, 600)


def test_downscale_shrinks_large_image() -> None:
    img = Image.new("RGB", (3840, 2160), color=(10, 20, 30))
    out = _downscale(img, max_side=1280)
    assert max(out.size) == 1280


def test_as_jpeg_base64_roundtrip() -> None:
    img = Image.new("RGB", (64, 48), color=(200, 100, 50))
    buf = io.BytesIO()
    img.save(buf, format="PNG")
    result = CaptureResult(png_bytes=buf.getvalue(), width=64, height=48, monitor_index=1)
    b64 = result.as_jpeg_base64(max_side=1280, quality=80)
    raw = base64.b64decode(b64)
    decoded = Image.open(io.BytesIO(raw))
    assert decoded.format == "JPEG"
    assert decoded.size == (64, 48)