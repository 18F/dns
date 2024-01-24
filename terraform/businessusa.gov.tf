resource "aws_route53_zone" "businessusa_gov_zone" {
  name = "businessusa.gov"

  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "businessusa_gov_apex" {
  zone_id = aws_route53_zone.businessusa_gov_zone.zone_id
  name    = "businessusa.gov."
  type    = "A"
  alias {
    name                   = "d2gvzfl08lmr7j.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "businessusa_gov_apex_aaaa" {
  zone_id = aws_route53_zone.businessusa_gov_zone.zone_id
  name    = "businessusa.gov."
  type    = "AAAA"
  alias {
    name                   = "d2gvzfl08lmr7j.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "businessusa_gov_acmechallenge" {
  zone_id = aws_route53_zone.businessusa_gov_zone.zone_id
  name    = "_acme-challenge.businessusa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["_acme-challenge.businessusa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "businessusa_gov_www_acmechallenge" {
  zone_id = aws_route53_zone.businessusa_gov_zone.zone_id
  name    = "_acme-challenge.www.businessusa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["_acme-challenge.www.businessusa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "businessusa_gov_www" {
  zone_id = aws_route53_zone.businessusa_gov_zone.zone_id
  name    = "www.businessusa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["www.businessusa.gov.external-domains-production.cloud.gov."]
}

module "businessusa_gov_emailsecurity" {
  source = "./email_security"

  zone_id = aws_route53_zone.businessusa_gov_zone.zone_id
  txt_records = ["v=spf1 -all"]
}

output "businessusa_gov_ns" {
  value = aws_route53_zone.businessusa_gov_zone.name_servers
}