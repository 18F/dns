resource "aws_route53_zone" "sbst_gov_zone" {
  name = "sbst.gov."

  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "sbst_gov_sbst_gov_a" {
  zone_id = aws_route53_zone.sbst_gov_zone.zone_id
  name    = "sbst.gov."
  type    = "A"

  alias {
    name                   = "d277n30llb5z4h.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "sbst_gov_sbst_gov_aaaa" {
  zone_id = aws_route53_zone.sbst_gov_zone.zone_id
  name    = "sbst.gov."
  type    = "AAAA"

  alias {
    name                   = "d277n30llb5z4h.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "sbst_gov_www_sbst_gov_a" {
  zone_id = aws_route53_zone.sbst_gov_zone.zone_id
  name    = "www.sbst.gov."
  type    = "A"

  alias {
    name                   = "d277n30llb5z4h.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "sbst_gov_www_sbst_gov_aaaa" {
  zone_id = aws_route53_zone.sbst_gov_zone.zone_id
  name    = "www.sbst.gov."
  type    = "AAAA"

  alias {
    name                   = "d277n30llb5z4h.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "sbst_gov_6020162f64c7bb016b2a3de7428839d0_www_sbst_gov_cname" {
  zone_id = aws_route53_zone.sbst_gov_zone.zone_id
  name    = "6020162f64c7bb016b2a3de7428839d0.www.sbst.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["e1eaa443027a9960e21419ecde173b2b8ebdf10b.comodoca.com."]
}

module "sbst_gov__email_security" {
  source  = "./email_security"
  zone_id = aws_route53_zone.sbst_gov_zone.zone_id
}

output "sbst_gov_ns" {
  value = aws_route53_zone.sbst_gov_zone.name_servers
}
