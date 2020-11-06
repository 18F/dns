resource "aws_route53_zone" "plainlanguage_toplevel" {
  name = "plainlanguage.gov"

  tags {
    Project = "dns"
  }
}

variable "cloud_gov_external_domain_zone_id" {
  type        = "string"
  description = "zone for cloud.gov external domains"
}

resource "aws_route53_record" "plainlanguage_apex_alias" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "plainlanguage.gov."
  type    = "A"

  alias {
    name                   = "plainlanguage.gov.external-domains-production.cloud.gov."
    zone_id                = "${var.cloud_gov_external_domain_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "plainlanguage_acme_challenge_cname" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "_acme-challenge.plainlanguage.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.plainlanguage.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "plainlanguage_www_cname" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "www.plainlanguage.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["www.plainlanguage.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "plainlanguage_www_acme_challenge_cname" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "_acme-challenge.www.plainlanguage.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.www.plainlanguage.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "demo_plainlanguage_a" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "demo.plainlanguage.gov."
  type    = "A"

  alias {
    name                   = "d18mn70cbq9e90.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "plainlanguage_google_mx" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "plainlanguage.gov."
  type    = "MX"
  ttl     = "300"
  records = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com."
  ]
}

module "plainlanguage_gov__email_security" {
  source = "./email_security"

  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  txt_records = [
    "google-site-verification=dgYaMRA2hd9PDUV1zEcRyWmTOVZCbkbP3vXd4isEZLI",
    "v=spf1 include:_spf.google.com include:spf_sa.gsa.gov ~all"
  ]
}

output "plainlanguage_ns" {
  value = "${aws_route53_zone.plainlanguage_toplevel.name_servers}"
}
