output "private_instance_id" {
  description = "ID of the private EC2 instance"
  value       = aws_instance.private_ec2.id
}

output "private_instance_private_ip" {
  description = "Private IP address of the private EC2 instance"
  value       = aws_instance.private_ec2.private_ip
}
