from companion.config import Settings
from companion.vision_client import VisionClient


def _settings(api_key: str = "sk-test") -> Settings:
    return Settings(
        api_key=api_key,
        base_url="https://api.openai.com/v1",
        model="gpt-4o-mini",
        name="Lumen",
        language="fr",
    )


def test_system_prompt_french() -> None:
    client = VisionClient(_settings())
    prompt = client.system_prompt()
    assert "Lumen" in prompt
    assert "français" in prompt
    client.close()


def test_ask_requires_api_key() -> None:
    client = VisionClient(_settings(api_key=""))
    try:
        client.ask("bonjour")
        assert False, "should have raised"
    except RuntimeError as exc:
        assert "clé API" in str(exc)
    finally:
        client.close()


def test_history_updated_on_success(monkeypatch) -> None:
    client = VisionClient(_settings())

    class FakeResponse:
        status_code = 200

        def json(self):
            return {"choices": [{"message": {"content": "Salut !"}}]}

        @property
        def text(self):
            return ""

    def fake_post(*_args, **_kwargs):
        return FakeResponse()

    assert client._client is not None
    monkeypatch.setattr(client._client, "post", fake_post)
    reply = client.ask("hello")
    assert reply == "Salut !"
    assert len(client.history) == 2
    assert client.history[0].role == "user"
    assert client.history[1].role == "assistant"
    client.close()