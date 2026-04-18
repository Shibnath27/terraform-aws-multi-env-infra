variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}
variable "key_name" {}
variable "instance_name" {}
variable "environment" {}
variable "project_name" {}

variable "instance_count" {
  type    = number
}

variable "common_tags" {
  description = "Common tags to be applied to resources"
  type        = map(string)
  default     = {}
}

variable "env" {
  description = "Environment name (from terraform.workspace)"
  type        = string
}

variable "key_name" {
  description = "Path to the SSH public key file"
  type        = string
}
