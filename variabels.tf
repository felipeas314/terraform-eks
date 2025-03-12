# variables.tf (na raiz)
variable "aws_region" {
  type        = string
  description = "Região AWS utilizada para provisionar os recursos."
  default     = "us-east-1"
}
