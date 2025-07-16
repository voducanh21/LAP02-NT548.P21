# AWS Infrastructure Deployment using CloudFormation and AWS CLI

## Project Structure

- `vpc.yml`: Tạo VPC, Public Subnet, Private Subnet, Internet Gateway.
- `nat_gateway.yml`: Tạo Elastic IP và NAT Gateway cho Private Subnet.
- `security_groups.yml`: Tạo các Security Groups cho EC2.
- `ec2_public.yml`: Tạo EC2 instance nằm trong Public Subnet.
- `ec2_private.yml`: Tạo EC2 instance nằm trong Private Subnet.

## Prerequisites

- AWS CLI đã cài đặt: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
- AWS CLI đã cấu hình credential: `aws configure`
- Tài khoản IAM cần đủ quyền: EC2, VPC, CloudFormation.

## How to Deploy

Thực hiện từng lệnh theo đúng thứ tự sau:

```bash
# Bước 1: Tạo VPC và Subnets
aws cloudformation create-stack --stack-name vpc-stack --template-body file://vpc.yml --region ap-southeast-1

# Bước 2: Tạo NAT Gateway
aws cloudformation create-stack --stack-name nat-gateway-stack --template-body file://nat_gateway.yml --region ap-southeast-1

# Bước 3: Tạo Security Groups
aws cloudformation create-stack --stack-name security-groups-stack --template-body file://security_groups.yml --region ap-southeast-1

# Bước 4: Tạo EC2 Public Instance
aws cloudformation create-stack --stack-name ec2-public-stack --template-body file://ec2_public.yml --region ap-southeast-1

# Bước 5: Tạo EC2 Private Instance
aws cloudformation create-stack --stack-name ec2-private-stack --template-body file://ec2_private.yml --region ap-southeast-1
