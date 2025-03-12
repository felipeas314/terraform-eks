# modules/vpc/main.tf
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 4.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = slice(var.availability_zones, 0, 3)  # Exemplo, usar 3 AZs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = false

  # Outras configurações como NAT Gateway, tags, etc.
  tags = var.tags
}
