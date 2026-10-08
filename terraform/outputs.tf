output "kms_key_arn" {
  description = "KMS key ARN used by the example secret."
  value       = module.kms.key_arn
}

output "secret_arn" {
  description = "Secrets Manager ARN for the example application secret."
  value       = module.secrets.secret_arn
}

output "application_role_arn" {
  description = "Least-privilege IAM role ARN for the example workload."
  value       = module.iam.role_arn
}
