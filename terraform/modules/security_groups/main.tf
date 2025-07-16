resource "aws_security_group" "public_sg" {
  name        = "public-sg"
  description = "Allow SSH from home IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from my home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-sg"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private-sg"
  description = "Allow SSH from public EC2 only"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from public EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-sg"
  }
}
