resource "aws_instance" "bastion" {
  ami = "ami-6b3fd60c"
  instance_type = "t2.nano"
  subnet_id = "${aws_subnet.subnet-zone1-public-1.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  # key pair is needed to be able to execute the users script 
  key_name = "${var.key_name}"
  user_data = "${file("scripts/users.sh")}"
  tags {
    Name = "${var.env_name}-bastion"
  }
}

resource "aws_eip" "eip-bastion" {
  vpc = true
  instance = "${aws_instance.bastion.id}"
  tags {
    Name = "${var.env_name}-bastion-eip}"
  }
}