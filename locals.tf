locals {
  env_config = {
    dev = {
      instance_count = 2
      bucket_count   = 1
      table_count    = 1
    }
    staging = {
      instance_count = 2
      bucket_count   = 2
      table_count    = 2
    }
    prod = {
      instance_count = 3
      bucket_count   = 3
      table_count    = 3
    }
  }

  current = lookup(local.env_config, terraform.workspace, local.env_config["dev"])


  common_tags = {
    Project     = var.project_name
    Environment = terraform.workspace
    ManagedBy   = "Terraform"
  }
}
