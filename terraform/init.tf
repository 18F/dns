provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    region = "us-east-1"
  }
}

variable "cloudfront_zone_id" {
  default = "Z33AYJ8TM3BH4J"
}
