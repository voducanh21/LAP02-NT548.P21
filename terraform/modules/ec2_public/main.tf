resource "aws_instance" "public_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "${var.instance_name}-public"
  }
}
