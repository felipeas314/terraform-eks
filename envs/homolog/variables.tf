variable "aws_region" {
  type        = string
  description = "Região AWS para provisionar os recursos"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block da VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type        = list(string)
  description = "AZs onde serão criados subnets"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "private_subnets" {
  type        = list(string)
  description = "Subnets privadas"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  type        = list(string)
  description = "Subnets públicas"
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "cluster_version" {
  type        = string
  description = "Versão do EKS"
  default     = "1.25"
}
