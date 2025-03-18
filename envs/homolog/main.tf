terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.7"
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

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      args        = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }
}

resource "helm_release" "kong" {
  name             = "kong"
  repository       = "https://charts.konghq.com"
  chart            = "kong"
  version          = "2.13.0"
  namespace        = "kong"
  create_namespace = true
}

