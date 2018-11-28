resource "aws_elb" "aws-testbed-elb" {
  name = "aws-testbed-elb"

  subnets = ["${aws_subnet.aws-testbed-public-1.id}",
    "${aws_subnet.aws-testbed-public-2.id}",
  ]

  security_groups = ["${aws_security_group.elb-securitygroup.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  connection_draining         = true
  connection_draining_timeout = 400

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
