terraform {
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # profile = var.aws_profile
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name         = "homolog-vpc"
  vpc_cidr         = var.vpc_cidr
  azs              = var.azs
  private_subnets  = var.private_subnets
  public_subnets   = var.public_subnets

  enable_nat_gateway  = true
  single_nat_gateway  = false

  tags = {
    Environment = "homolog"
    Project     = "my-eks-project"
  }
}

module "eks" {
  source = "../../modules/eks"

  cluster_name    = "homolog-eks"
  cluster_version = "1.25"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  # (opcional) control_plane_subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true
  manage_aws_auth_configmap      = true

  # Caso queira node groups gerenciados
  eks_managed_node_groups = {
    blue = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "homolog"
  }
}

