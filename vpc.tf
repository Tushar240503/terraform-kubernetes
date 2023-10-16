provider "aws" {
    region = "ap-south-1"
}

variable vpc_cidr_block {}
variable public_subnet_cidr_blocks {}
variable private_subnet_cidr_blocks {}

data "aws_availability_zones" "azs"{}

module "myapp-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name = "myapp-vpc"
  cidr = var.vpc_cidr_block
  azs = data.aws_availability_zones.azs.names 
  private_subnets = var.private_subnet_cidr_blocks
  public_subnets = var.public_subnet_cidr_blocks # Use availability_zones here

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/myapp-eks" = "shared"
  }
  public_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks" = "shared"
    "kubernetes.io/role/eld" = 1
  }
  private_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks" = "shared"
    "kubernetes.io/role/internal-eld" = 1
  }
}

