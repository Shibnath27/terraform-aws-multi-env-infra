locals {
  environment = terraform.workspace

  # 🔥 Proper naming standard
  name_prefix = "${var.project_name}-${local.environment}"

  # Count-style naming
  instance_name = "${local.name_prefix}-server"

  common_tags = {
    Project     = var.project_name
    Environment = local.environment
    ManagedBy   = "Terraform"
    Workspace   = terraform.workspace
  }
}
