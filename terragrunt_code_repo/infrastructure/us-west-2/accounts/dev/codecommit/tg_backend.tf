# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "terraform-backend-dev-jmm"
    dynamodb_table = "terraform-backend-lock-table-dev"
    encrypt        = true
    key            = "infrastructure/dev/codecommit/terraform.tfstate"
    profile        = "dev"
    region         = "us-west-2"
  }
}
