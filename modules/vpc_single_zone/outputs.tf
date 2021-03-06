output "vpc-id" {
  value = "${aws_vpc.vpc.id}"
}

output "bastion-eip" {
  value = "${aws_eip.eip-bastion.public_ip}"
}

output "sn_zone1_public1_id" {
  value = "${aws_subnet.subnet-zone1-public-1.id}"
}

output "sg_private_id" {
  value = "${aws_security_group.private.id}"
}

output "sn_zone1_private1_id" {
  value = "${aws_subnet.subnet-zone1-private-1.id}"
}

output "dns_zone_id" {
  value = "${aws_route53_zone.dnsZone.zone_id}"
}
