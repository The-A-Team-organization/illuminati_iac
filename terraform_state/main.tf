provider "aws" {
  region = var.region
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
  }


  backend "s3" {
    bucket         = "terraform-state-illuminati-bucket-frankfurt"
    key            = "terraform_state/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform_locks"
    encrypt        = true
  }
}

