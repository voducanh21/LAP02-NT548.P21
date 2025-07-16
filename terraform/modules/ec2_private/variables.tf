variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the Private Subnet"
  type        = string
}

variable "key_name" {
  description = "SSH Key pair name"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "private_security_group_id" {
  description = "ID of the private security group"
  type        = string
}
