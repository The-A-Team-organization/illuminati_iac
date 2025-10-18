variable "env" {
  description = "Specifies the target environment (e.g., dev, stage, prod) for resource provisioning"
  type        = string
}

variable "region" {
  description = "The region to create the resources in"
  type        = string
}

variable "repositories" {
  description = "List of ECR repositories to create"
  type        = list(string)
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
