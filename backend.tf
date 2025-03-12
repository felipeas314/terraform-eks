terraform {
  backend "s3" {
    bucket         = "nome-do-bucket-terraform"
    key            = "my-eks-project/homolog/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}