# modules/vpc/variables.tf
variable "vpc_name" {
  type        = string
  description = "Nome da VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR principal da VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade"
}

variable "private_subnets" {
  type        = list(string)
  description = "Lista de subnets privadas"
}

variable "public_subnets" {
  type        = list(string)
  description = "Lista de subnets públicas"
}

variable "tags" {
  type        = map(string)
  description = "Mapeamento de tags padrão"
  default     = {}
}
