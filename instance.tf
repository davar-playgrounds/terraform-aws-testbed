data "aws_ami" "search" {
  most_recent = true

  filter {
    name = "virtualization-type"

    values = ["${var.VIRTUALIZATION_TYPE}"]
  }

  name_regex = "${lookup(var.AMIS_OS_MAP_REGEX, var.OS)}"

  owners = ["${lookup(var.AMIS_OS_MAP_OWNERS, var.OS)}"]
}

resource "aws_instance" "private_instance_01" {
  ami                    = "${data.aws_ami.search.id}"
  instance_type          = "t2.micro"
  availability_zone      = "${var.AVAILABILITY_ZONE_A}"
  subnet_id              = "${aws_subnet.aws-testbed-private-1.id}"
  vpc_security_group_ids = ["${aws_security_group.aws-testbed-instance.id}"]
  key_name               = "${aws_key_pair.aws-testbed-key-pair.key_name}"
}

resource "aws_instance" "private_instance_02" {
  ami                    = "${data.aws_ami.search.id}"
  instance_type          = "t2.micro"
  availability_zone      = "${var.AVAILABILITY_ZONE_B}"
  subnet_id              = "${aws_subnet.aws-testbed-private-2.id}"
  vpc_security_group_ids = ["${aws_security_group.aws-testbed-instance.id}"]
  key_name               = "${aws_key_pair.aws-testbed-key-pair.key_name}"
}

resource "aws_instance" "private_instance_03" {
  ami                    = "${data.aws_ami.search.id}"
  instance_type          = "t2.micro"
  availability_zone      = "${var.AVAILABILITY_ZONE_C}"
  subnet_id              = "${aws_subnet.aws-testbed-private-3.id}"
  vpc_security_group_ids = ["${aws_security_group.aws-testbed-instance.id}"]
  key_name               = "${aws_key_pair.aws-testbed-key-pair.key_name}"
}
