# AWS Infrastructure Deployment with Terraform

## Project Structure

- /modules/vpc: VPC, Subnets, Internet Gateway
- /modules/nat_gateway: NAT Gateway
- /modules/route_table: Route Tables
- /modules/security_groups: Security Groups
- /modules/ec2_public: Public EC2
- /modules/ec2_private: Private EC2
- main.tf, variables.tf, outputs.tf: Root terraform scripts

## Prerequisites

- AWS account
- AWS CLI configured (`~/.aws/credentials`)
- Docker installed

## How to Deploy

```bash

# Khởi tạo terraform
docker run --rm -v ${PWD}:/workspace -v ${env:USERPROFILE}\.aws:/root/.aws -w /workspace hashicorp/terraform:latest init

# Lập kế hoạch triển khai (kiểm tra trước khi apply)
docker run --rm -v ${PWD}:/workspace -v ${env:USERPROFILE}\.aws:/root/.aws -w /workspace hashicorp/terraform:latest plan

# Thực hiện triển khai hạ tầng tự động (không cần xác nhận thủ công)
docker run --rm -v ${PWD}:/workspace -v ${env:USERPROFILE}\.aws:/root/.aws -w /workspace hashicorp/terraform:latest apply -auto-approve
