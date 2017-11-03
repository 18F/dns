provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    region = "us-east-1"
  }
}

locals {
  cloudfront_zone_id = "Z33AYJ8TM3BH4J"
}
