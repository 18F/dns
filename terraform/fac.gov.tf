resource "aws_route53_zone" "fac_gov_zone" {
  name = "fac.gov."

  tags = {
    Project = "dns"
  }
}

# Wait to provision after service is launched
# resource "aws_route53_record" "fac_gov_fac_gov_apex" {
#   zone_id = aws_route53_zone.fac_gov_zone.zone_id
#   name    = "fac.gov."
#   type    = "A"

#   alias {
#     name                   = "fac.gov.external-domains-production.cloud.gov."
#     zone_id                = local.cloud_gov_cloudfront_zone_id
#     evaluate_target_health = false
#   }
# }

resource "aws_route53_record" "fac_gov__acme_challenge_fac_gov_cname" {
  zone_id = aws_route53_zone.fac_gov_zone.zone_id
  name    = "_acme-challenge.fac.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["_acme-challenge.fac.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "fac_gov__www_fac_gov_cname" {
  zone_id = aws_route53_zone.fac_gov_zone.zone_id
  name    = "www.fac.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["www.fac.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "fac_gov__acme_challenge_www_fac_cname" {
  zone_id = aws_route53_zone.fac_gov_zone.zone_id
  name    = "_acme-challenge.www.fac.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["_acme-challenge.www.fac.gov.external-domains-production.cloud.gov."]
}

module "fac_gov__email_security" {
  source = "./email_security"

  zone_id = aws_route53_zone.fac_gov_zone.zone_id
  txt_records = [
    local.spf_no_mail
  ]
}

output "fac_gov_ns" {
  value = aws_route53_zone.fac_gov_zone.name_servers
}
