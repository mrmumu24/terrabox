provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name = var.vpc_name
  cidr     = var.base_cidr
}

module "subnets" {
  source = "./modules/subnet"

  name               = "dev"
  vpc_id             = module.vpc.id
  vpc_name           = module.vpc.name
  vpc_default_rt     = module.vpc.default_rt
  availability_zones = var.availability_zones
  subnets            = var.subnets
  nacl_rules         = var.nacl_rules
}

module "security_group" {
  source = "./modules/security-group"

  name        = "sg"
  vpc_id      = module.vpc.id
  vpc_name    = module.vpc.name
  description = var.sg_description
  sg_rules    = var.sg_rules
}

module "ec2" {
  source = "./modules/ec2"

  number_of_ec2 = length(var.private_ips)

  instance_name   = "instance"
  ami_id          = var.ami_id
  key_name        = var.key_name
  vpc_name        = module.vpc.name
  subnet_ids      = module.subnets.ids
  private_ips     = var.private_ips
  instance_type   = var.instance_type
  security_groups = [module.security_group.id]

}
