provider "aws" {
  region  = "us-east-1"
  version = "~> 2.52"
}

terraform {
  required_version = "~> 0.11.0"
  backend "s3" {
    region = "us-east-1"
  }
}

locals {
  // https://docs.aws.amazon.com/general/latest/gr/rande.html#elb_region
  elb_zone_id = "Z35SXDOTRQ7X7K"

  # https://cyber.dhs.gov/bod/18-01/#how-should-dmarc-be-deployed
  # https://cyber.dhs.gov/bod/18-01/#where-should-dmarc-reports-be-sent
  dmarc_reject = "v=DMARC1; p=reject; pct=100; fo=1; ri=86400; rua=mailto:dmarcreports@gsa.gov,mailto:reports@dmarc.cyber.dhs.gov; ruf=mailto:dmarcfailures@gsa.gov"

  spf_hubspot = "v=spf1 include:1962994.spf05.hubspotemail.net ~all"
}
