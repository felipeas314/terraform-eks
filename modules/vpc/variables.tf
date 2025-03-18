variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
}

variable "private_subnets" {
  type        = list(string)
  description = "Subnets privadas"
}

variable "public_subnets" {
  type        = list(string)
  description = "Subnets públicas"
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether to enable NAT gateways"
  default     = true
}

variable "single_nat_gateway" {
  type        = bool
  description = "Whether to use a single NAT gateway"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Tags to be applied to resources"
  default     = {}
}
