# state.tf
terraform {
  backend "s3" {
    bucket  = "terraform-state-gildev"
    key     = "site/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true

  }
}
