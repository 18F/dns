# cloud.gov DNS configuration is managed separately:
# https://github.com/cloud-gov/cg-provision/blob/master/terraform/stacks/dns/stack.tf

locals {
  cloud_gov_cloudfront_zone_id = "Z2FDTNDATAQYW2"
  cloud_gov_external_domain_broker_production_zone_id = "Z0495817NJX7TT8AXUM0"
}
