resource "aws_key_pair" "aws-testbed-key-pair" {
  key_name   = "aws-testbed-key-pair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"

  lifecycle {
    ignore_changes = ["public_key"]
  }
}
