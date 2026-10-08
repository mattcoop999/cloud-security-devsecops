#!/usr/bin/env bash
set -euo pipefail

echo "Running local security baseline checks..."
python policies/check_security_baseline.py

if command -v docker >/dev/null 2>&1; then
  echo "Docker available. You can build with: docker build -t cloud-security-devsecops-demo:local ./app"
else
  echo "Docker not found locally. Skipping container build hint."
fi

echo "Security check completed."
