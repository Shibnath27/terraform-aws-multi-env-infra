locals {
  environment = terraform.workspace

  config = {
    dev = {
      instance_count = 2
      bucket_count = 1
      table_count  = 1
    }
    staging = {
      instance_count = 2
      bucket_count = 2
      table_count  = 2
    }
    prod = {
      instance_count = 3
      bucket_count = 3
      table_count  = 3
    }
  }

  current = local.config[local.environment]

  name_prefix = "${var.project_name}-${local.environment}"

  # Count-style naming
  instance_name = "${local.name_prefix}-server"

  common_tags = {
    Project     = var.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
  }
}
