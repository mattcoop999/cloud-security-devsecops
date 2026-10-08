# Pipeline Security Controls

## Purpose

Document the security controls applied during CI/CD.

## Controls

- Run unit tests before building release artifacts.
- Scan dependencies for known vulnerabilities.
- Build containers from a minimal base image.
- Run container vulnerability scanning.
- Validate Terraform syntax before review.
- Check Kubernetes manifests for basic hardening settings.
- Require pull requests for infrastructure and security changes.

## Evidence

Pipeline results, scan outputs, and pull request approvals provide evidence that security checks ran before merge.
