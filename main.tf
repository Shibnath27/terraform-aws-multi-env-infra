# Get latest Amazon Linux AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  cidr                = var.vpc_cidr
  public_subnet_cidr  = var.subnet_cidr
  environment         = local.environment
  project_name        = var.project_name
}

# Security Group Module
module "sg" {
  source = "./modules/security-group"

  vpc_id        = module.vpc.vpc_id
  ingress_ports = var.ingress_ports
  environment   = local.environment
  project_name  = var.project_name
}

# EC2 Module
module "ec2" {
  source = "./modules/ec2-instance"

  ami_id             = data.aws_ami.amazon_linux.id
  instance_type      = var.instance_type
  subnet_id          = module.vpc.subnet_id
  security_group_ids = [module.sg.sg_id]
  key_name           = aws_key_pair.generated.key_name
  instance_name      = local.instance_name
  environment        = local.environment
  project_name       = var.project_name
}

# --- S3 Module ---
module "s3" {
  source = "./modules/s3"

  env          = terraform.workspace
  bucket_count = local.current.bucket_count
  common_tags  = local.common_tags
}

# --- DynamoDB Module ---
module "dynamodb" {
  source = "./modules/dynamodb"

  env         = terraform.workspace
  table_count = local.current.table_count
  common_tags = local.common_tags
}