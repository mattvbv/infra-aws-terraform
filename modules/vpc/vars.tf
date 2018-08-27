variable "env_name" {
  description = "The name to give to the cloud environment that is being created (could be a customer name, a project, an environment...)"
}

variable "domain_name" {
  description = "Internal domain name for the instances in the VPC. Example : dev.myorg.aws.internal"
}

variable "key_name" {
  description = "The name of the key pair to configure the access to the EC2 instances"
}
variable "vpc-cidr-block" {
  description = "Example : 10.0.0.0/16"
}

variable "subnet-zone1-public-1-cidr-block" {
  description = "Example : 10.0.10.0/24"
}

variable "subnet-zone1-private-1-cidr-block" {
  description = "Example : 10.0.110.0/24"
}