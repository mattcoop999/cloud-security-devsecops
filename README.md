# Cloud Security and DevSecOps Enablement

This DevOps portfolio project demonstrates how security controls can be built into cloud infrastructure, containers, Kubernetes workloads, and CI/CD pipelines.

It is designed for DevOps Engineer, Cloud Engineer, Infrastructure Engineer, Platform Engineer, and DevSecOps-focused roles. The project is intentionally safe and uses example infrastructure patterns rather than real credentials or production resources.

## Project Scenario

A financial services engineering team needs stronger security controls across application delivery and cloud operations. Previous releases relied on manual reviews, inconsistent secrets handling, broad IAM permissions, and limited pipeline security checks.

This project shows how I would improve the security posture by introducing:

- least-privilege IAM examples
- KMS encryption patterns
- secrets management examples
- secure Docker image practices
- Kubernetes security contexts
- dependency and container vulnerability scanning
- infrastructure-as-code validation
- policy-as-code style checks
- pull-request security gates
- operational security runbooks

## What This Project Demonstrates

- Secure CI/CD pipeline design
- DevSecOps checks in GitHub Actions
- Python dependency scanning with `pip-audit`
- Container scanning with Trivy
- Terraform validation and security review workflow
- Kubernetes workload hardening
- IAM role and policy design
- Secrets Manager and KMS patterns
- Security documentation for access, incidents, and vulnerability response

## Architecture

```text
Developer Pull Request
        |
        v
GitHub Actions Security Gates
        |-- unit tests
        |-- dependency audit
        |-- container build
        |-- container vulnerability scan
        |-- terraform fmt/validate
        |-- policy checks
        v
Secure Deployment Artifacts
        |
        +-- Kubernetes manifests
        +-- Terraform modules
        +-- Security runbooks
```

## Repository Structure

```text
.
+-- app/                  # Small FastAPI service used for security pipeline examples
+-- terraform/            # IAM, KMS, and Secrets Manager examples
+-- k8s/                  # Kubernetes hardening examples
+-- policies/             # Lightweight policy checks
+-- scripts/              # Local security validation helper
+-- docs/                 # Security runbooks and governance notes
+-- .github/workflows/    # DevSecOps CI workflow
```

## Security Controls Included

### CI/CD Security Gates

The GitHub Actions workflow demonstrates:

- Python test execution
- dependency vulnerability scanning
- Docker image build
- Trivy container scan
- Terraform formatting and validation
- lightweight policy checks

### Kubernetes Hardening

The Kubernetes deployment includes:

- non-root container execution
- read-only root filesystem
- dropped Linux capabilities
- resource requests and limits
- health probes
- secret references
- network policy

### Cloud Security Patterns

The Terraform examples include:

- IAM role with scoped permissions
- KMS key for encryption
- Secrets Manager secret example
- environment-aware naming
- tagging for ownership and auditability

## Local Usage

Install app dependencies:

```bash
cd app
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

Run tests:

```bash
pytest -q
```

Run local security checks:

```bash
bash scripts/security-check.sh
```

Build container:

```bash
docker build -t cloud-security-devsecops-demo:local ./app
```

## Interview Talking Point

Use this project to say:

```text
I built a DevSecOps portfolio project to show how security can be embedded into cloud infrastructure and CI/CD workflows. It includes a small FastAPI service, a secure Dockerfile, Kubernetes hardening controls, Terraform examples for IAM, KMS, and secrets management, and a GitHub Actions workflow that runs tests, dependency checks, container scanning, Terraform validation, and policy checks.

The value is that security becomes repeatable and visible inside the delivery process. Instead of relying only on manual review, the pipeline catches common issues early, infrastructure changes are reviewed as code, and operational teams have runbooks for access control, vulnerability response, and secrets handling.
```

## Status

Portfolio demonstration project. It does not deploy real production infrastructure by default.
