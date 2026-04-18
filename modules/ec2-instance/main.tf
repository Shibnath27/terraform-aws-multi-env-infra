resource "aws_instance" "this" {
  count = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  key_name = aws_key_pair.this.key_name

  associate_public_ip_address = true

   root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  tags = merge(
    var.common_tags,
    {
      Name        = "${var.project_name}-${var.environment}-ec2-${count.index + 1}"
      Environment = var.environment
      Project     = var.project_name
    }
  ) 
}

resource "aws_key_pair" "this" {
  key_name   = "${var.env}-terra-automate-key"
  public_key = file(var.key_name)
}
