from fastapi import FastAPI
from pydantic import BaseModel


app = FastAPI(title="Cloud Security DevSecOps Demo", version="1.0.0")


class SecurityStatus(BaseModel):
    service: str
    encryption_required: bool
    secrets_externalized: bool
    running_as_non_root: bool


@app.get("/health")
def health():
    return {"status": "healthy"}


@app.get("/security-status", response_model=SecurityStatus)
def security_status():
    return SecurityStatus(
        service="cloud-security-devsecops-demo",
        encryption_required=True,
        secrets_externalized=True,
        running_as_non_root=True,
    )
