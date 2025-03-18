module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  # Nome e versão do cluster
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  # Em qual VPC
  vpc_id = var.vpc_id

  # Subnets para os node groups
  subnet_ids = var.subnet_ids

  # (opcional) Subnets específicas para o control plane
  control_plane_subnet_ids = var.control_plane_subnet_ids

  # Se o endpoint do cluster será público
  cluster_endpoint_public_access = var.cluster_endpoint_public_access

  # Se o módulo deve gerenciar o configmap aws-auth
  manage_aws_auth_configmap = var.manage_aws_auth_configmap

  # Se quiser addons nativos (vpc-cni, kube-proxy, coredns etc.)
  cluster_addons = var.cluster_addons

  # EKS Managed Node Groups
  eks_managed_node_groups = var.eks_managed_node_groups

  # Self Managed Node Groups (Opcional, se usar EC2 “clássico”)
  self_managed_node_groups = var.self_managed_node_groups

  # Fargate Profiles (caso queira rodar workloads serverless)
  fargate_profiles = var.fargate_profiles

  # Tags em geral
  tags = var.tags
}
