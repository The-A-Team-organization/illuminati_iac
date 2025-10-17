variable "vpc_id" {
  description = "The VPC ID where Jenkins will be deployed"
  type        = string
}

variable "private_subnets_for_jenkins" {
  description = "The subnet where Jenkins will be deployed"
  type        = string
}

variable "env" {
  description = "Specifies the target environment (e.g., dev, stage, prod) for resource provisioning"
  type        = string
}

variable "region" {
  description = "The region to create the resources in"
  type        = string
}

variable "ami" {
  description = "Machine Image that provides the software necessary to configure and launch an EC2 instance"
  type        = string
}

variable "common_tags" {
  type = map(string)
  default = {
    "CreatedBy"   = "Terraform"
    "Project"     = "Illuminati"
    "Environment" = "dev"
    "Repository"  = "https://github.com/The-A-Team-organization/illuminati_iac"
    "Module"      = "environment_setup"
  }
}

variable "availability_zone" {
  description = "Availability zone for subnets"
  type        = string
}

