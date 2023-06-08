provider "aws" {
   region     = "ap-south-1"
}

module "webserver" {
  source = "/root/modules/project11/ec2"
  subnet = module.vpc.subnet_id
  security-group = module.security-group.security_group_id
}

module "vpc" {
  source = "/root/modules/project11/vpc"
  cidr = var.cidr
  subnet = var.subnet
}

module "security-group" {
  source = "/root/modules/project11/sg"
  vpc = module.vpc.vpc_id
}



variable "cidr" {
 default= "10.0.0.0/16"
}

variable "subnet" {
 default= "10.0.0.0/24"
}

