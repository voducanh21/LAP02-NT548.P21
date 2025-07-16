variable "ami_id" {
  description = "AMI ID to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the Public Subnet"
  type        = string
}

variable "security_group_id" {
  description = "Security Group ID to attach"
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
