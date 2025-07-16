resource "aws_instance" "private_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_security_group_id]
  key_name                    = var.key_name

  associate_public_ip_address = false

  tags = {
    Name = "${var.instance_name}-private"
  }
}
