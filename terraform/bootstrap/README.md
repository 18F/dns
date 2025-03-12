# Bootstrap Configuration

This needs to be run as a privileged user in the account on first run to create the infrastructure needed by the circleci-deployer user, as this user does not have IAM permissions to create these resources itself.

## Security Improvements

The bootstrap configuration has been updated to address several security findings:

1. **SNS Topic Encryption**
   - All SNS topics are now encrypted with AWS KMS

2. **S3 Bucket Event Notifications**
   - Added event notifications to all buckets including log buckets 
   - Created separate SNS topics for main, logs, and replica buckets

3. **S3 Bucket Cross-Region Replication**
   - Main bucket already had cross-region replication
   - Added skip comments for log buckets as they don't need replication
   - Clarified replica bucket status with skip comments

4. **S3 Bucket Lifecycle Configurations**
   - Added lifecycle configuration to replica bucket
   - All buckets now have proper lifecycle rules

5. **S3 Bucket Access Logging**
   - Access logs bucket now logs to a logs-of-logs bucket
   - Replica bucket logs to a dedicated logs bucket in the west region

6. **KMS Encryption**
   - All buckets now use KMS encryption instead of AES256
   - Log buckets now use the same KMS key as the main bucket

## Resources Created

- S3 bucket for Terraform state with:
  - Server-side encryption using KMS
  - Public access blocks
  - Versioning enabled
  - Lifecycle policies
  - Cross-region replication to disaster recovery bucket
  - Access logging
  - Event notifications

- KMS keys for encryption
  - State bucket encryption key
  - Replica bucket encryption key

- IAM user and policy for CircleCI deployments with permissions for:
  - Route53 management
  - S3 bucket access for Terraform state
  - KMS key usage for decryption/encryption

## Security Considerations

Some security checks are bypassed with checkov skip comments because:

1. The Route53 permissions need broad access to manage DNS records
2. The IAM policy is attached directly to a user rather than a role as this fits the CircleCI deployment pattern
3. Some wildcard resources are necessary for the CI/CD pipeline functionality
4. Log buckets don't need cross-region replication as they're not critical

## Example IAM Policy

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
