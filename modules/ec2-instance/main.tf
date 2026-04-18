resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids

  key_name = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.project_name}-${var.environment}-server"
  }
}
resource "aws_key_pair" "generated" {
  key_name   = "terra-automate-key"
  public_key = file("terra-automate-key.pub")
}
