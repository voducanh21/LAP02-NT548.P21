# Tạo VPC, Subnets, Internet Gateway
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  vpc_name            = "my-vpc"
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}

# Tạo NAT Gateway
module "nat_gateway" {
  source = "./modules/nat_gateway"
  public_subnet_id    = module.vpc.public_subnet_id
  internet_gateway_id = module.vpc.igw_id
  vpc_name            = "my-vpc"
}

# Tạo Route Tables cho Public và Private
module "route_table" {
  source = "./modules/route_table"
  vpc_id              = module.vpc.vpc_id
  vpc_name            = module.vpc.vpc_name
  public_subnet_id    = module.vpc.public_subnet_id
  private_subnet_id   = module.vpc.private_subnet_id
  internet_gateway_id = module.vpc.igw_id
  nat_gateway_id      = module.nat_gateway.nat_gateway_id
}

# Tạo Security Groups
module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
  my_ip  = "42.117.43.209/32" # IP nhà bạn
}

# Tạo EC2 Public
module "ec2_public" {
  source             = "./modules/ec2_public"
  ami_id             = "ami-004dea1f77bd3fa11"
  instance_type      = "t2.micro"
  public_subnet_id   = module.vpc.public_subnet_id
  security_group_id  = module.security_groups.public_sg_id
  key_name           = "terraform-key-new"
  instance_name      = "demo-ec2"
}

# Tạo EC2 Private
module "ec2_private" {
  source                   = "./modules/ec2_private"
  ami_id                   = "ami-004dea1f77bd3fa11"
  instance_type            = "t2.micro"
  private_subnet_id        = module.vpc.private_subnet_id
  private_security_group_id = module.security_groups.private_sg_id
  key_name                 = "terraform-key-new"
  instance_name            = "demo-ec2"
}
