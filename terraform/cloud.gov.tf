# cloud.gov DNS configuration is managed separately:
# https://github.com/18F/cg-provision/blob/master/terraform/stacks/dns/stack.tf

locals {
  cloud_gov_cloudfront_zone_id = "Z2FDTNDATAQYW2"
}
