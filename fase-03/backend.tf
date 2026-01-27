# state.tf
terraform {
  backend "s3" {
    bucket  = "terraform-state-gildev"
    key     = "site2/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    use_lockfile = true

  }
}
