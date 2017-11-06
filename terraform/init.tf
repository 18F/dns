provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    region = "us-east-1"
  }
}

locals {
  // Unclear where this value comes from; presumably it's a deprecated value from AWS. -Aidan Feldman, 11/6/17
  old_cloudfront_zone_id = "Z33AYJ8TM3BH4J"

  // https://docs.aws.amazon.com/general/latest/gr/rande.html#cf_region
  cloudfront_zone_id = "Z2FDTNDATAQYW2"
  // https://docs.aws.amazon.com/general/latest/gr/rande.html#elb_region
  elb_zone_id = "Z35SXDOTRQ7X7K"
}
