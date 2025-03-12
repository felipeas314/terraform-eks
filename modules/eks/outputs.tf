# modules/eks/outputs.tf
output "cluster_id" {
  description = "ID do cluster EKS"
  value       = module.eks.cluster_id
}

output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint do cluster EKS"
  value       = module.eks.cluster_endpoint
}

output "cluster_oidc_issuer" {
  description = "OIDC Issuer URL do cluster EKS"
  value       = module.eks.cluster_oidc_issuer_url
}
