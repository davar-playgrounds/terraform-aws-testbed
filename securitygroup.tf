resource "aws_security_group" "aws-testbed-instance" {
  vpc_id      = "${aws_vpc.aws-testbed.id}"
  name        = "aws-testbed-instance"
  description = "security group for aws testbed instance"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elb-securitygroup.id}"]
  }

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elb-securitygroup.id}"]
  }

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elb-securitygroup.id}"]
  }

  ingress {
    from_port       = 8443
    to_port         = 8443
    protocol        = "tcp"
    security_groups = ["${aws_security_group.elb-securitygroup.id}"]
  }

  tags {
    Name         = "aws-testbed-instance"
    private_name = "aws-testbed-instance"
    public_name  = "instance"
    application         = "${var.APPLICATION}"
    delete_tag   = "${var.DELETE_TAG}"
    application_id       = "${var.APPLICATION_ID}"
    OS           = "none"
    environment  = "${var.ENVIRONMENT}"
    cost_center  = "${var.COST_CENTER}"
  }
}

resource "aws_security_group" "elb-securitygroup" {
  vpc_id      = "${aws_vpc.aws-testbed.id}"
  name        = "elb"
  description = "security group for load balancer"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name         = "aws-testbed-elb"
    private_name = "aws-testbed-elb"
    public_name  = "elb"
    application         = "${var.APPLICATION}"
    delete_tag   = "${var.DELETE_TAG}"
    application_id       = "${var.APPLICATION_ID}"
    OS           = "none"
    environment  = "${var.ENVIRONMENT}"
    cost_center  = "${var.COST_CENTER}"
  }
}
