variable "env_name" {
  default = "infra-test"
}

variable "domain_name" {
  default = "infra-test.aws.internal"
}

variable "key_name" {
  default = "ec2_key_pair"
}

variable "vpc-cidr-block" {
  default = "10.0.0.0/16"
}

variable "subnet-zone1-public-1-cidr-block" {
  default = "10.0.10.0/24"
}

variable "subnet-zone1-private-1-cidr-block" {
  default = "10.0.110.0/24"
}