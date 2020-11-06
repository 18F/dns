# cloud.gov DNS configuration is managed separately:
# https://github.com/18F/cg-provision/blob/master/terraform/stacks/dns/stack.tf

variable "cloud_gov_external_domin_zone_id" {
  type        = string
  description = "zone for cloud.gov external domains"
}

locals {
  cloud_gov_cloudfront_zone_id = "Z2FDTNDATAQYW2"
}
