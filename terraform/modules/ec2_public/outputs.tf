output "public_ip" {
  description = "Public IP of the EC2 Instance"
  value       = aws_instance.public_ec2.public_ip
}
