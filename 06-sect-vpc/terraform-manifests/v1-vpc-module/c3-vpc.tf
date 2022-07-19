# Create VPC Terraform Module
module "app-vpc-dev" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.2"
  # insert the 23 required variables here

  # VPC Basic Details
  name = "weknowx-vpc"
  cidr = "10.0.0.0/16" # 10.0.0.0/8 is reserved for EC2-Classic
  azs  = ["us-east-1a", "us-east-1b"]
  # azs                 = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24"]

  # Databse Subnet
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  database_subnets                   = ["10.0.21.0/24", "10.0.22.0/24"]
  #create_database_nat_gateway_route = false
  #create_database_internet_gateway_route = false

  # NAT Gatewys - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support   = true

  # Tags
  public_subnet_tags = {
    name = "public-subnets-weknowx"
    type = "public-subnets"
  }
  private_subnet_tags = {
    name = "private-subnets-weknowx"
    type = "private-subnets"
  }
  database_subnet_tags = {
    name = "database-subnets-weknowx"
    type = "database-subnets"
  }

  tags = {
    Project     = "We KnowX"
    Environment = "Dev"
  }

  vpc_tags = {
    Name = "VPC-weknowX-dev"
  }

}

