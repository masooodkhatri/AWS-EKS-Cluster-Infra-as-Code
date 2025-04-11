`# main.tf
provider "aws" {
  region = var.region
}

locals {
  cluster_name = "eks-cluster-${formatdate("YYYYMMDD-HHmm", timestamp())}"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.cluster_name
  cluster_version = "1.27"

  # Updated parameter names for newer module version
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.public_subnets

  # Enable cluster endpoint public access
  cluster_endpoint_public_access = true

  # Updated node groups configuration
  eks_managed_node_groups = {
    eks_nodes = {
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.micro"]
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  name    = "eks-vpc"
  cidr    = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}
