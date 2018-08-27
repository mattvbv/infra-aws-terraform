variable "envName" {
  description = "The name to give to the cloud environment that is being created (could be a customer name, a project, an environment..."
}
variable "vpc-cidr-block" {
  description = "Example : 10.0.0.0/16"
}

variable "subnet-zone1-public1-cidr-block" {
  description = "Example : 10.0.10.0/24"
}