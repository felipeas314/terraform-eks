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
