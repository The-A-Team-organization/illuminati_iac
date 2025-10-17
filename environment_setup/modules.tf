module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "Jenkins" {
  source                      = "./modules/jenkins"
  vpc_id                      = module.vpc.vpc_id
  private_subnets_for_jenkins = var.private_subnets_for_jenkins
  env                         = var.env
  region                      = var.region
  ami                         = var.ami
  availability_zone           = var.availability_zone
}

