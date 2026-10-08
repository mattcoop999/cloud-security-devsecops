variable "name_prefix" {
  type = string
}

variable "secret_arn" {
  type = string
}

variable "kms_key_arn" {
  type = string
}

variable "trusted_role" {
  type = string
}

variable "tags" {
  type = map(string)
}
