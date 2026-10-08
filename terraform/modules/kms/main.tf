resource "aws_kms_key" "app" {
  description             = "KMS key for DevSecOps demo application secrets"
  deletion_window_in_days = 7
  enable_key_rotation     = true
  tags                    = var.tags
}

resource "aws_kms_alias" "app" {
  name          = "alias/${var.name_prefix}-app-secrets"
  target_key_id = aws_kms_key.app.key_id
}
