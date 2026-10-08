resource "aws_secretsmanager_secret" "app" {
  name        = "${var.name_prefix}/application/api-token"
  description = "Example app secret encrypted with KMS"
  kms_key_id  = var.kms_key_id
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "placeholder" {
  secret_id = aws_secretsmanager_secret.app.id
  secret_string = jsonencode({
    API_TOKEN = "replace-in-real-environment"
  })
}
