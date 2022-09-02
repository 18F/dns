resource "aws_route53_zone" "tts_gsa_gov_zone" {
  name = "tts.gsa.gov."

  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "tts_gsa_gov_a" {
  zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
  name    = "tts.gsa.gov."
  type    = "A"

  alias {
    name                   = "159.142.191.107"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "tts_gsa_gov_aaaa" {
  zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
  name    = "tts.gsa.gov."
  type    = "AAAA"

  alias {
    name                   = "159.142.191.107"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "join_tts_gsa_gov" {
  zone_id = aws_route53_zone.usability_toplevel.zone_id
  name    = "join.tts.gsa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["d2yv2z3hlrarbd.cloudfront.net."]
}

module "tts_gov__email_security" {
  source = "./email_security"

  zone_id     = aws_route53_zone.tts_gsa_gov_zone.zone_id
  txt_records = ["v=spf1 include:amazonses.com ~all"]
}

output "tts_gsa_gov_ns" {
  value = aws_route53_zone.tts_gsa_gov_zone.name_servers
}
