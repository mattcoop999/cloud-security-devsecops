from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]


def assert_contains(path, expected):
    text = path.read_text()
    missing = [item for item in expected if item not in text]
    if missing:
        raise AssertionError(f"{path} is missing: {', '.join(missing)}")


def main():
    assert_contains(
        ROOT / "k8s" / "deployment.yaml",
        [
            "runAsNonRoot: true",
            "allowPrivilegeEscalation: false",
            "readOnlyRootFilesystem: true",
            "drop:",
            "automountServiceAccountToken: false",
        ],
    )
    assert_contains(
        ROOT / "terraform" / "modules" / "kms" / "main.tf",
        ["enable_key_rotation     = true"],
    )
    assert_contains(
        ROOT / "terraform" / "modules" / "iam" / "main.tf",
        ["secretsmanager:GetSecretValue", "kms:Decrypt"],
    )
    print("Security baseline checks passed.")


if __name__ == "__main__":
    main()
