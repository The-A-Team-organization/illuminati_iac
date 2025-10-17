variable "region" {
  description = "The region to create the resources in"
  type        = string
}

variable "env" {
  description = "Specifies the target environment (e.g., dev, stage, prod) for resource provisioning"
  type        = string
}

variable "ami" {
  description = "Machine Image that provides the software necessary to configure and launch an EC2 instance"
  type        = string
}

variable "private_subnets_for_jenkins" {
  description = "The subnet where Jenkins will be deployed"
  type        = string
}


variable "instance_type" {
  description = "default instance type for our project"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for subnets"
  type        = string
}

