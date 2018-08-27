output "vpc-id" {
  value = "${aws_vpc.vpc.id}"
}

output "bastion-eip" {
  value = "${aws_eip.eip-bastion.public_ip}"
}

