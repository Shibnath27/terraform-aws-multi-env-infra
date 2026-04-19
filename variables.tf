variable "region" {
  type    = string
  default = "us-west-2"
}

variable "project_name" {
  type    = string
  default = "terraweek"
}

variable "vpc_cidr" {
  type = string
}

variable "subnet_cidr" {
  type = string
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "ingress_ports" {
  type    = list(number)
  default = [22, 80]
}


# 🔥 SSH KEY
variable "key_public_path" {
  description = "Path to the public SSH key"
  type        = string
  default     = "terra-automate-key.pub"
}