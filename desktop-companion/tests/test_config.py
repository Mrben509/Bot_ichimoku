from companion.config import Settings


def test_has_api_key_true() -> None:
    s = Settings(
        api_key="sk-test",
        base_url="https://api.openai.com/v1",
        model="gpt-4o-mini",
        name="Lumen",
        language="fr",
    )
    assert s.has_api_key is True


def test_has_api_key_false_on_blank() -> None:
    s = Settings(
        api_key="   ",
        base_url="https://api.openai.com/v1",
        model="gpt-4o-mini",
        name="Lumen",
        language="fr",
    )
    assert s.has_api_key is False