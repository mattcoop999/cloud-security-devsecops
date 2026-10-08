from fastapi.testclient import TestClient

from main import app


client = TestClient(app)


def test_health_endpoint():
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json()["status"] == "healthy"


def test_security_status_endpoint():
    response = client.get("/security-status")
    assert response.status_code == 200
    payload = response.json()
    assert payload["encryption_required"] is True
    assert payload["secrets_externalized"] is True
    assert payload["running_as_non_root"] is True
