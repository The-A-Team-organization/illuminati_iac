provider "aws" {
  region = var.region
  default_tags {
    tags = {
      "CreatedBy"   = "Terraform"
      "Project"     = "Illuminati"
      "Environment" = "${var.env}"
      "Repository"  = "https://github.com/The-A-Team-organization/illuminati_iac"
      "Module"      = "environment_setup"
    }
  }
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
    key            = "account-setup/terraform.tfstate"
    region         = var.region
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

