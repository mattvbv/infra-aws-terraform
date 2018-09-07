output "vpc-id" {
  value = "${aws_vpc.vpc.id}"
}

output "bastion-eip" {
  value = "${aws_eip.eip-bastion.public_ip}"
}

output "sg_private_id" {
  value = "${aws_security_group.private.id}"
}

output "sn_zone1_private1_id" {
  value = "${aws_subnet.subnet-zone1-private-1.id}"
}
