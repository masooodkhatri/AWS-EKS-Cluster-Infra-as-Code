# variables.tf
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"  # optional, if you want a default
}
