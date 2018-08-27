resource "aws_subnet" "subnet-zone1-public1" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet-zone1-public1-cidr-block}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags {
    Name = "${var.envName}-zone1-public1-${data.aws_availability_zones.available.names[0]}"
  }
}
