resource "aws_route53_zone" "dnsZone" {
  name = "${var.domain_name}"
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route53_record" "bastion" {
  zone_id = "${aws_route53_zone.dnsZone.zone_id}"
  name = "bastion.${var.domain_name}"
  type = "A"
  ttl = "300"
  records = ["${aws_instance.bastion.private_ip}"]
}
