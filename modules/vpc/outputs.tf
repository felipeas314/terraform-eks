# modules/vpc/outputs.tf
output "vpc_id" {
  description = "ID da VPC criada"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Subnets privadas"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Subnets públicas"
  value       = module.vpc.public_subnets
}

output "nat_gateway_ids" {
  description = "Lista de NAT Gateways"
  value       = module.vpc.nat_gateway_ids
}
