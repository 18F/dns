# Checkov Compliance Documentation

This document describes the Checkov compliance status of our Terraform code, including intentional exceptions and mitigations.

## Overview

We use [Checkov](https://github.com/bridgecrewio/checkov) as part of our infrastructure-as-code security scanning. While we strive for full compliance with security best practices, some exceptions are necessary due to technical requirements or practical limitations.

## Bootstrap Infrastructure

The bootstrap infrastructure in the `/terraform/bootstrap` directory has several intentional exceptions to Checkov rules:

### S3 Bucket Exceptions

| Check ID | Resource | Justification |
|----------|----------|--------------|
| CKV_AWS_18 | `aws_s3_bucket.logs_for_logs` | This is a top-level log bucket for logging other log buckets. Adding access logging here would create a circular dependency. |
| CKV_AWS_144 | `aws_s3_bucket.logs_for_logs` | Cross-region replication not needed for tertiary log data; focus is on replicating primary state data. |
| CKV2_AWS_62 | `aws_s3_bucket.logs_for_logs` | Event notifications not deemed essential for logs-of-logs bucket as it's tertiary data. |
| CKV_AWS_144 | `aws_s3_bucket.backend_replica` | This bucket is already a replica itself and doesn't need further replication. |
| CKV2_AWS_62 | `aws_s3_bucket.backend_replica` | Event notifications are configured via separate resource. |
| CKV_AWS_18 | `aws_s3_bucket.replica_logs` | This is a log bucket for the replica and doesn't need its own access logging. |
| CKV_AWS_144 | `aws_s3_bucket.replica_logs` | This bucket is already in the disaster recovery region and doesn't need further replication. |
| CKV2_AWS_62 | `aws_s3_bucket.replica_logs` | Event notifications not essential for log data in disaster recovery region. |

### IAM Policy Exceptions

| Check ID | Resource | Justification |
|----------|----------|--------------|
| CKV_AWS_290 | `aws_iam_user_policy.circleci_deployer_policy` | The CircleCI deployment user needs write access to manage DNS records and state files. |
| CKV_AWS_289 | `aws_iam_user_policy.circleci_deployer_policy` | The policy needs specific Route53 permissions for DNS management. |
| CKV_AWS_355 | `aws_iam_user_policy.circleci_deployer_policy` | Route53 management requires resource wildcards for DNS records. |
| CKV_AWS_40 | `aws_iam_user_policy.circleci_deployer_policy` | Using direct user attachment for CircleCI pipeline integration. |

### DNS/DNSSEC Exceptions

| Check ID | Resource | Justification |
|----------|----------|--------------|
| CKV_AWS_33 | `aws_kms_key.datagov_zone` | DNSSEC requires specific KMS key policy configuration with service principals. |

## Mitigations

While some security checks are bypassed, we have implemented the following mitigations:

1. **Enhanced Encryption**:
   - All S3 buckets use KMS encryption instead of AWS default encryption
   - KMS key retention periods increased to 30 days
   - KMS key rotation is enabled

2. **Comprehensive Logging**:
   - Multiple layers of access logging for S3 buckets
   - All state changes generate notifications
   - Event-driven architecture to track changes

3. **Cross-Region Redundancy**:
   - Critical state data is replicated across regions
   - Disaster recovery configured for main state buckets

4. **SNS Topic Security**:
   - All SNS topics are encrypted with KMS
   - SNS topic subscriptions use a variable for email address

## CI/CD Integration

Checkov is integrated into our CI/CD pipeline and runs on all pull requests. Security findings are addressed unless specifically exempted in this document. The scan results are part of the PR review process.

## Recent Improvements

Recent security improvements include:

1. Added KMS encryption to all S3 buckets and SNS topics
2. Implemented notification system for all bucket operations
3. Hardened bucket security with public access blocks
4. Added cross-region replication for disaster recovery
5. Implemented proper lifecycle policies for all buckets
6. Added logging hierarchy to capture all access events
7. Added DNSSEC to critical DNS zones
8. Made notification email address configurable via variables
9. Extended KMS key deletion window to 30 days

## Future Work

Future security improvements under consideration:

1. Transition CircleCI authentication from IAM user to IAM role with OIDC
2. Implement more granular Route53 permissions
3. Add automatic key rotation for longer-term KMS keys
4. Implement AWS CloudTrail integration for enhanced auditing