output "vpc-id" {
  value = "${module.vpc.vpc-id}"
}

output "bastion-eip" {
  value = "${module.vpc.bastion-eip}"
}

output "sg_private_id" {
  value = "${module.vpc.sg_private_id}"
}

output "sn_zone1_private1_id" {
  value = "${module.vpc.sn_zone1_private1_id}"
}

