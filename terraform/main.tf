terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "kms" {
  source      = "./modules/kms"
  name_prefix = var.name_prefix
  tags        = var.tags
}

module "secrets" {
  source      = "./modules/secrets"
  name_prefix = var.name_prefix
  kms_key_id  = module.kms.key_id
  tags        = var.tags
}

module "iam" {
  source       = "./modules/iam"
  name_prefix  = var.name_prefix
  secret_arn   = module.secrets.secret_arn
  kms_key_arn  = module.kms.key_arn
  trusted_role = var.trusted_role
  tags         = var.tags
}
