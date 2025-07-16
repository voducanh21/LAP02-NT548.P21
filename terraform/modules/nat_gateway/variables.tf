variable "public_subnet_id" {
  description = "ID of the Public Subnet where NAT Gateway will be deployed"
  type        = string
}

variable "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC (for tags)"
  type        = string
}
