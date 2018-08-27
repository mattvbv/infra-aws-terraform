provider "aws" {
}

terraform {
  backend "local" {
    # Must be a relative
    path = "./terraform.tfstate"
  }
}

module "vpc" {
  source = "../modules/vpc_single_zone"
  env_name = "${var.env_name}"
  domain_name = "${var.domain_name}"
  key_name = "${var.key_name}"
  vpc-cidr-block = "${var.vpc-cidr-block}"
  subnet-zone1-public-1-cidr-block = "${var.subnet-zone1-public-1-cidr-block}"
  subnet-zone1-private-1-cidr-block = "${var.subnet-zone1-private-1-cidr-block}"
}

