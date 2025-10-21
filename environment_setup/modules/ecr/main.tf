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

}

resource "aws_ecr_repository" "repos" {
  for_each = toset(var.repositories)

  name                 = "${each.value}_${var.env}"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(var.common_tags, {
    Name = "${each.value}_${var.env}_repository"
  })
}
