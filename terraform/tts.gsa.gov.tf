resource "aws_route53_zone" "tts_gsa_gov_zone" {
  name = "tts.gsa.gov."

  tags = {
    Project = "dns"
  }
}

# ACME challenge for tts.gsa.gov
resource "aws_route53_record" "_acme_challenge_tts_gsa_gov_cname" {
  zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
  name    = "_acme-challenge.tts.gsa.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["_acme-challenge.tts.gsa.gov.external-domains-production.cloud.gov."]
}

# A record for tts.gsa.gov
resource "aws_route53_record" "tts_gsa_gov_a" {
  zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
  name    = "tts.gsa.gov."
  type    = "A"
  records = ["159.142.191.107"]
  ttl     = "300"
}

# AAAA for tts.gsa.gov
#resource "aws_route53_record" "tts_gsa_gov_aaaa" {
#  zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
#  name    = "tts.gsa.gov."
#  type    = "AAAA"
#
#  alias {
#    name                   = "TBD"
#    zone_id                = local.cloud_gov_cloudfront_zone_id
#    evaluate_target_health = false
#  }
#}

# ACME challenge for handbook.tts.gsa.gov
resource "aws_route53_record" "_acme_challenge_handbook_tts_gsa_gov_cname" {
  zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
  name    = "_acme-challenge.handbook.tts.gsa.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["5G0wGlMZcqW5HUDxe21M0c4PKziWvZJ336t8f6ZP0-Y"]
}

# CNAME for handbook.tts.gsa.gov
resource "aws_route53_record" "handbook_tts_gsa_gov_cname" {
  zone_id = aws_route53_zone.tts_gsa_gov.zone_id
  name    = "handbook.tts.gsa.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["d1npw5jx1m5ink.cloudfront.net."]
}

# ACME challenge for join.tts.gsa.gov
resource "aws_route53_record" "_acme_challenge_join_tts_gsa_gov_cname" {
  zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
  name    = "_acme-challenge.join.tts.gsa.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["_acme-challenge.join.tts.gsa.gov.external-domains-production.cloud.gov."]
}

# CNAME for join.tts.gsa.gov
resource "aws_route53_record" "join_tts_gsa_gov_cname" {
  zone_id = aws_route53_zone.tts_gsa_gov.zone_id
  name    = "join.tts.gsa.gov."
  type    = "CNAME"
  ttl     = 60
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

