provider "aws" {
}

terraform {
  backend "local" {
    # Must be a relative
    path = "./terraform.tfstate"
  }
}

module "vpc" {
  source = "../modules/vpc"
  envName = "${var.envName}"
  vpc-cidr-block = "${var.vpc-cidr-block}"
  subnet-zone1-public1-cidr-block = "${var.subnet-zone1-public1-cidr-block}"
}

