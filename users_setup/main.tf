provider "aws" {
  region = ""
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
  }

  backend "s3" {
    bucket         = "terraform-state-illuminati"
    key            = "users_setup/terraform-state/terraform.tfstate"
    region         = ""
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
