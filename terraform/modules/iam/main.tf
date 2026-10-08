data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [var.trusted_role]
    }
  }
}

data "aws_iam_policy_document" "app_access" {
  statement {
    sid = "ReadApplicationSecret"
    actions = [
      "secretsmanager:GetSecretValue",
      "secretsmanager:DescribeSecret"
    ]
    resources = [var.secret_arn]
  }

  statement {
    sid = "DecryptApplicationSecret"
    actions = [
      "kms:Decrypt"
    ]
    resources = [var.kms_key_arn]
  }
}

resource "aws_iam_role" "app" {
  name               = "${var.name_prefix}-application-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.tags
}

resource "aws_iam_policy" "app_access" {
  name   = "${var.name_prefix}-application-secret-access"
  policy = data.aws_iam_policy_document.app_access.json
  tags   = var.tags
}

resource "aws_iam_role_policy_attachment" "app_access" {
  role       = aws_iam_role.app.name
  policy_arn = aws_iam_policy.app_access.arn
}
