# provider.tf
provider "aws" {
  region = var.aws_region
  # profile = var.aws_profile   # Opcional
}
