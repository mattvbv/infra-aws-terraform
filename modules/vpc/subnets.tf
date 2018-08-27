resource "aws_subnet" "subnet-zone1-public-1" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet-zone1-public-1-cidr-block}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags {
    Name = "${var.env_name}-zone1-public-1-${data.aws_availability_zones.available.names[0]}"
  }
}

resource "aws_route_table_association" "route-table-association-zone1-public-1" {
  subnet_id = "${aws_subnet.subnet-zone1-public-1.id}"
  route_table_id = "${aws_route_table.internet-out-route-table.id}"
}

resource "aws_subnet" "subnet-zone1-private-1" {
  vpc_id = "${aws_vpc.vpc.id}"
  cidr_block = "${var.subnet-zone1-private-1-cidr-block}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags {
    Name = "${var.env_name}-zone1-private-1-${data.aws_availability_zones.available.names[0]}"
  }
}
resource "aws_route_table_association" "route-table-association-zone1-private-1" {
  subnet_id = "${aws_subnet.subnet-zone1-private-1.id}"
  route_table_id = "${aws_route_table.through-nat-route-table.id}"
}