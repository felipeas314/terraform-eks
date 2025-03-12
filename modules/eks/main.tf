# modules/eks/main.tf
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.subnets
  vpc_id          = var.vpc_id

  # Configurações de nós gerenciados:
  manage_aws_auth          = true
  create_eks               = true
  iam_role_name            = "${var.cluster_name}-eks-role"
  cluster_endpoint_public_access = true
  cluster_endpoint_private_access = false

  # Node groups - Exemplo de nó gerenciado
  node_groups = {
    default = {
      desired_capacity = var.node_desired_capacity
      max_capacity     = var.node_max_capacity
      min_capacity     = var.node_min_capacity

      instance_types = var.node_instance_types

      subnet_ids = var.subnets

      tags = {
        Name = "${var.cluster_name}-node-group"
      }
    }
  }

  # Habilitar logging
  cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  # Outras configurações de segurança e etc:
  enable_irsa = true

  tags = var.tags
}
