resource "aws_s3_bucket" "backend" {
  bucket = "tts-dns-terraform-state"

  versioning {
    enabled = true
  }

  # Adding server side encryption with AWS KMS
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.s3_encryption_key.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  # Adding lifecycle configuration
  lifecycle_rule {
    id      = "state-files"
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

  # Enable access logging
  logging {
    target_bucket = aws_s3_bucket.access_logs.id
    target_prefix = "log/backend-state-bucket/"
  }
}

# Create bucket for access logs
resource "aws_s3_bucket" "access_logs" {
  bucket = "tts-dns-terraform-state-logs"

  # Enable versioning for audit trail
  versioning {
    enabled = true
  }
  
  # Server-side encryption for logs
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Retention policy for logs
  lifecycle_rule {
    id      = "log-retention"
    enabled = true

    expiration {
      days = 365
    }
  }
}

# Block public access to the state bucket
resource "aws_s3_bucket_public_access_block" "backend_public_access_block" {
  bucket = aws_s3_bucket.backend.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Block public access to the logs bucket
resource "aws_s3_bucket_public_access_block" "logs_public_access_block" {
  bucket = aws_s3_bucket.access_logs.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# KMS key for S3 bucket encryption
resource "aws_kms_key" "s3_encryption_key" {
  description             = "KMS key for terraform state S3 bucket encryption"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action   = "kms:*"
        Resource = "*"
      }
    ]
  })
  
  tags = {
    Name    = "terraform-state-kms-key"
    Project = "dns"
  }
}

resource "aws_kms_alias" "s3_key_alias" {
  name          = "alias/terraform-state-key"
  target_key_id = aws_kms_key.s3_encryption_key.key_id
}

# Add data source for account identity
data "aws_caller_identity" "current" {}

# Create SNS topic for S3 bucket event notifications
resource "aws_sns_topic" "s3_events" {
  name = "terraform-state-bucket-events"
  
  tags = {
    Name    = "terraform-state-sns-topic"
    Project = "dns"
  }
}

# Subscribe TTS operations email to the SNS topic
resource "aws_sns_topic_subscription" "s3_events_email" {
  topic_arn = aws_sns_topic.s3_events.arn
  protocol  = "email"
  endpoint  = "tts-tech-operatons@gsa.gov"
}

# Allow S3 to publish to the SNS topic
resource "aws_sns_topic_policy" "s3_events_policy" {
  arn    = aws_sns_topic.s3_events.arn
  policy = data.aws_iam_policy_document.s3_events_policy_document.json
}

data "aws_iam_policy_document" "s3_events_policy_document" {
  statement {
    sid    = "AllowS3ToPublishToSNS"
    effect = "Allow"
    
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    
    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.s3_events.arn]
    
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [aws_s3_bucket.backend.arn]
    }
  }
}

# Configure S3 event notifications
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.backend.id
  
  # Notify on all object deletion events
  topic {
    topic_arn     = aws_sns_topic.s3_events.arn
    events        = ["s3:ObjectRemoved:*"]
    filter_suffix = ".tfstate"
  }
  
  # Notify on state file creation/modification
  topic {
    topic_arn     = aws_sns_topic.s3_events.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".tfstate"
  }
}
