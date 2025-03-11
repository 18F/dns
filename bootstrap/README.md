This needs to be run as a privledged user in the account on first run to create this ARN needed by the circleci-deployer user as the user doesnt not have IAM permissions to create to ARN

```hcl
# Create IAM user for CircleCI deployment permissions
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
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "${aws_s3_bucket.backend.arn}"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": [
                "${aws_s3_bucket.backend.arn}/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt",
                "kms:GenerateDataKey"
            ],
            "Resource": ["${aws_kms_key.s3_encryption_key.arn}"]
        }
    ]
}
EOF
}
```