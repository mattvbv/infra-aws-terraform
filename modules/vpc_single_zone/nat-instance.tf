resource "aws_instance" "nat-instance" {
  ami = "ami-756d8f12"
  instance_type = "t2.nano"
  subnet_id = "${aws_subnet.subnet-zone1-public-1.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.nat.id}"]
  source_dest_check = false
  # key pair is needed to be able to execute the users script 
  key_name = "${var.key_name}"
  user_data = "${file("scripts/users.sh")}"
  tags {
    Name = "${var.env_name}-nat-instance"
  }
}