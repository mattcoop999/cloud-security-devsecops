# Secrets Management Runbook

## Purpose

Provide a safe process for storing and rotating application secrets.

## Standard Approach

1. Store secrets in a managed secret store.
2. Encrypt secrets with a managed KMS key.
3. Do not commit secrets to Git.
4. Inject secrets at runtime using platform-supported mechanisms.
5. Rotate secrets after suspected exposure or on a defined schedule.

## Incident Steps

1. Revoke or rotate the exposed credential.
2. Check audit logs for suspicious use.
3. Update the secret in the managed secret store.
4. Restart or redeploy affected workloads.
5. Document the incident and preventive action.
