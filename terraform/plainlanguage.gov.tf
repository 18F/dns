resource "aws_route53_zone" "plainlanguage_toplevel" {
  name = "plainlanguage.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "plainlanguage_apex" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "plainlanguage.gov."
  type    = "A"

  alias {
    name                   = "d1qy5q7pncs690.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "plainlanguage_www" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "www.plainlanguage.gov."
  type    = "A"

  alias {
    name                   = "d1qy5q7pncs690.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
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

resource "aws_route53_record" "plainlanguage_google_txt" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "plainlanguage.gov."
  type    = "TXT"
  ttl     = 600
  records = [
    "google-site-verification=dgYaMRA2hd9PDUV1zEcRyWmTOVZCbkbP3vXd4isEZLI",
    "v=spf1 include:_spf.google.com include:spf_sa.gsa.gov ~all"
  ]
}

# BOD
resource "aws_route53_record" "plainlanguage_gov__dmarc_plainlanguage_gov_txt" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name    = "_dmarc.plainlanguage.gov."
  type    = "TXT"
  ttl     = 300
  records = ["${local.dmarc_reject}"]
}


output "plainlanguage_ns" {
  value = "${aws_route53_zone.plainlanguage_toplevel.name_servers}"
}
