resource "aws_security_group" "bastion" {
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    description = "Allow ssh access from anywhere"
    from_port = "22"
    to_port = "22"
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow outbound traffic to anywhere"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "sg-${var.env_name}-bastion"
  }
}

resource "aws_security_group" "nat" {
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    description = "Allow all from anywhere"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow outbound traffic to anywhere"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "sg-${var.env_name}-nat"
  }
}

resource "aws_security_group" "private" {
  vpc_id = "${aws_vpc.vpc.id}"
  ingress {
    description = "Allow all from anywhere"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow outbound traffic to anywhere"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags {
    Name = "sg-${var.env_name}-private"
  }
}
