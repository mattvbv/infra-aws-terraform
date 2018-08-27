resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.vpc.id}"
  tags {
    Name = "${var.env_name}-igw"
  }
}

resource "aws_route_table" "internet-out-route-table" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags {
    Name = "${var.env_name}-internet-out-route-table"
  }
}

resource "aws_route_table" "through-nat-route-table" {
  vpc_id = "${aws_vpc.vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    instance_id = "${aws_instance.nat-instance.id}"
  }
  tags {
    Name = "${var.env_name}-through-nat-route-table"
  }
}
