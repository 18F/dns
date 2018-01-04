provider "aws" {
  version = "~> 1.0"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "backend" {
  bucket = "tts-dns-terraform-state"

  versioning {
    enabled = true
  }
}


resource "aws_iam_user" "deployer" {
  name = "circleci-deployer"
}

resource "aws_iam_user_policy" "circleci_deployer_policy" {
  name = "route53-deployment"
  user = "${aws_iam_user.deployer.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "route53:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
