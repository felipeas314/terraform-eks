# modules/eks/variables.tf
variable "cluster_name" {
  type        = string
  description = "Nome do EKS Cluster"
}
variable "cluster_version" {
  type        = string
  description = "Versão do Kubernetes EKS"
  default     = "1.25"
}
variable "vpc_id" {
  type        = string
  description = "ID da VPC onde o EKS será criado"
}
variable "subnets" {
  type        = list(string)
  description = "Subnets onde o EKS será criado"
}
variable "node_desired_capacity" {
  type        = number
  description = "Capacidade desejada do node group"
  default     = 2
}
variable "node_min_capacity" {
  type        = number
  description = "Capacidade mínima do node group"
  default     = 1
}
variable "node_max_capacity" {
  type        = number
  description = "Capacidade máxima do node group"
  default     = 4
}
variable "node_instance_types" {
  type        = list(string)
  description = "Tipos de instância para os nós"
  default     = ["t3.medium"]
}
variable "tags" {
  type        = map(string)
  description = "Mapeamento de tags padrão"
  default     = {}
}
