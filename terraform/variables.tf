variable "aws_region" {
  description = "AWS region for the demo resources."
  type        = string
  default     = "eu-west-2"
}

variable "name_prefix" {
  description = "Prefix used for demo security resources."
  type        = string
  default     = "devsecops-demo"
}

variable "trusted_role" {
  description = "Example trusted role ARN for workload access."
  type        = string
  default     = "arn:aws:iam::123456789012:role/example-ci-role"
}

variable "tags" {
  description = "Common tags for ownership and auditability."
  type        = map(string)
  default = {
    Owner       = "platform-security"
    Environment = "demo"
    ManagedBy   = "terraform"
  }
}
