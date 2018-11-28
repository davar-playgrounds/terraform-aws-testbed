resource "aws_s3_bucket" "bucket" {
  bucket = "aws-testbed-instance-bucket"
  acl    = "private"
  region = "${var.AWS_REGION}"

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags {
      "rule"      = "log"
      "autoclean" = "true"
    }

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }

  lifecycle_rule {
    id      = "tmp"
    prefix  = "tmp/"
    enabled = true

    expiration {
      date = "${var.S3_BUCKET_EXPIRATION_DATE}"
    }
  }
}

resource "aws_s3_bucket" "versioning_bucket" {
  bucket = "aws-testbed-versioning-bucket"
  acl    = "private"
  region = "${var.AWS_REGION}"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = 90
    }
  }
}
