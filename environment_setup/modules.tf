module "vpc" {
  source = "./modules/vpc"
  region = var.region
}


module "network" {
  source            = "./modules/network"
  vpc_id            = module.vpc.vpc_id
  env               = var.env
  region            = var.region
  availability_zone = var.availability_zone
}


module "jenkins" {
  source                 = "./modules/jenkins"
  vpc_id                 = module.vpc.vpc_id
  public_subnet          = module.network.public_subnet
  env                    = var.env
  region                 = var.region
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  jenkins_security_group = module.network.jenkins_security_group_id
}


module "ecr" {
  source       = "./modules/ecr/"
  env          = var.env
  region       = var.region
  repositories = ["frontend", "backend", "go_service", "mariadb"]
}


module "sonarqube" {
  source                   = "./modules/sonarqube"
  vpc_id                   = module.vpc.vpc_id
  public_subnet            = module.network.public_subnet
  env                      = var.env
  region                   = var.region
  ami                      = var.ami
  instance_type            = var.instance_type
  availability_zone        = var.availability_zone
  sonarqube_security_group = module.network.sonarqube_security_group_id
}

