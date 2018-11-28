resource "aws_vpc" "aws-testbed" {
  cidr_block           = "${var.CIDR_BLOCK_VPC}"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags {
    Name           = "aws-testbed-vpc"
    private_name   = "aws-testbed-vpc"
    public_name    = "vpc"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_subnet" "aws-testbed-public-1" {
  vpc_id                  = "${aws_vpc.aws-testbed.id}"
  cidr_block              = "${var.CIDR_BLOCK_01}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AVAILABILITY_ZONE_A}"

  tags {
    Name           = "aws-testbed-subnet-public-1"
    private_name   = "aws-testbed-subnet-public-1"
    public_name    = "subnet-public-1"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_subnet" "aws-testbed-public-2" {
  vpc_id                  = "${aws_vpc.aws-testbed.id}"
  cidr_block              = "${var.CIDR_BLOCK_02}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AVAILABILITY_ZONE_B}"

  tags {
    Name           = "aws-testbed-subnet-public-2"
    private_name   = "aws-testbed-subnet-public-2"
    public_name    = "subnet-public-2"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_subnet" "aws-testbed-public-3" {
  vpc_id                  = "${aws_vpc.aws-testbed.id}"
  cidr_block              = "${var.CIDR_BLOCK_03}"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AVAILABILITY_ZONE_C}"

  tags {
    Name           = "aws-testbed-subnet-public-3"
    private_name   = "aws-testbed-subnet-public-3"
    public_name    = "subnet-public-3"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_subnet" "aws-testbed-private-1" {
  vpc_id                  = "${aws_vpc.aws-testbed.id}"
  cidr_block              = "${var.CIDR_BLOCK_04}"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AVAILABILITY_ZONE_A}"

  tags {
    Name           = "aws-testbed-subnet-private-1"
    private_name   = "aws-testbed-subnet-private-1"
    public_name    = "subnet-private-1"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_subnet" "aws-testbed-private-2" {
  vpc_id                  = "${aws_vpc.aws-testbed.id}"
  cidr_block              = "${var.CIDR_BLOCK_05}"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AVAILABILITY_ZONE_B}"

  tags {
    Name           = "aws-testbed-subnet-private-2"
    private_name   = "aws-testbed-subnet-private-2"
    public_name    = "subnet-private-2"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_subnet" "aws-testbed-private-3" {
  vpc_id                  = "${aws_vpc.aws-testbed.id}"
  cidr_block              = "${var.CIDR_BLOCK_06}"
  map_public_ip_on_launch = "false"
  availability_zone       = "${var.AVAILABILITY_ZONE_C}"

  tags {
    Name           = "aws-testbed-subnet-private-3"
    private_name   = "aws-testbed-subnet-private-3"
    public_name    = "subnet-private-3"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_internet_gateway" "aws-testbed-gw" {
  vpc_id = "${aws_vpc.aws-testbed.id}"

  tags {
    Name           = "aws-testbed-internet-gateway"
    private_name   = "aws-testbed-internet-gateway"
    public_name    = "internet-gateway"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_route_table" "aws-testbed-public" {
  vpc_id = "${aws_vpc.aws-testbed.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.aws-testbed-gw.id}"
  }

  tags {
    Name           = "aws-testbed-public-route"
    private_name   = "aws-testbed-public-route"
    public_name    = "public-route"
    application           = "${var.APPLICATION}"
    delete_tag     = "${var.DELETE_TAG}"
    application_id = "${var.APPLICATION_ID}"
    OS             = "none"
    environment    = "${var.ENVIRONMENT}"
    cost_center    = "${var.COST_CENTER}"
  }
}

resource "aws_route_table_association" "aws-testbed-public-1-a" {
  subnet_id      = "${aws_subnet.aws-testbed-public-1.id}"
  route_table_id = "${aws_route_table.aws-testbed-public.id}"
}

resource "aws_route_table_association" "aws-testbed-public-2-a" {
  subnet_id      = "${aws_subnet.aws-testbed-public-2.id}"
  route_table_id = "${aws_route_table.aws-testbed-public.id}"
}

resource "aws_route_table_association" "aws-testbed-public-3-a" {
  subnet_id      = "${aws_subnet.aws-testbed-public-3.id}"
  route_table_id = "${aws_route_table.aws-testbed-public.id}"
}
