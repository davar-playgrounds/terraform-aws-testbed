output "ELB" {
  value = "${aws_elb.aws-testbed-elb.dns_name}"
}

output "VPC_ID" {
  value = "${aws_vpc.aws-testbed.id}"
}

output "AWS-TESTBED-PUBLIC-1" {
  value = "${aws_subnet.aws-testbed-public-1.id}"
}

output "AWS-TESTBED-PUBLIC-2" {
  value = "${aws_subnet.aws-testbed-public-2.id}"
}

output "AWS-TESTBED-PUBLIC-3" {
  value = "${aws_subnet.aws-testbed-public-3.id}"
}

output "AWS-TESTBED-PRIVATE-1" {
  value = "${aws_subnet.aws-testbed-private-1.id}"
}

output "AWS-TESTBED-PRIVATE-2" {
  value = "${aws_subnet.aws-testbed-private-2.id}"
}

output "AWS-TESTBED-PRIVATE-3" {
  value = "${aws_subnet.aws-testbed-private-3.id}"
}

output "ELB-SECURITYGROUP" {
  value = "${aws_elb.aws-testbed-elb.id}"
}

output "AWS-S3-BUCKET" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "AWS-S3-VERSIONING-BUCKET" {
  value = "${aws_s3_bucket.versioning_bucket.id}"
}

output "PRIVATE_INSTANCE_01" {
  value = "${aws_instance.private_instance_01.id}"
}

output "PRIVATE_INSTANCE_02" {
  value = "${aws_instance.private_instance_02.id}"
}

output "PRIVATE_INSTANCE_03" {
  value = "${aws_instance.private_instance_03.id}"
}
