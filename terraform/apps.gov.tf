resource "aws_route53_zone" "apps_gov_zone" {
  name = "apps.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "apps_gov_apps_gov_a" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "apps.gov."
  type    = "A"
  alias {
    name                   = "d24f99alwtdu0h.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "apps_gov__dmarc_apps_gov_txt" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "_dmarc.apps.gov."
  type    = "TXT"
  ttl     = 300
  records = ["${local.dmarc_reject}"]
}

resource "aws_route53_record" "apps_gov_apps_gov_txt" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "apps.gov."
  type    = "TXT"
  ttl     = 300
  records = ["${local.spf_no_mail}"]
}

resource "aws_route53_record" "apps_gov_7020370b93980d607416a29297f68e3b_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "7020370b93980d607416a29297f68e3b.apps.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["df309d7dd3fde8755d6d9da8bf2911dcc59f0eb8.comodoca.com."]
}

resource "aws_route53_record" "apps_gov__amazonses_apps_gov_txt" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "_amazonses.apps.gov."
  type    = "TXT"
  ttl     = 60
  records = ["9s5WB+tcaXC6+ygBRGy9ScjCLmNOme1BKW7s3y2+Y0s="]
}

resource "aws_route53_record" "apps_gov_f6vzy6nhqi3u6rk4yxxawrihkqtvx5by__domainkey_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "f6vzy6nhqi3u6rk4yxxawrihkqtvx5by._domainkey.apps.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["f6vzy6nhqi3u6rk4yxxawrihkqtvx5by.dkim.amazonses.com."]
}

resource "aws_route53_record" "apps_gov_nmhy3ybmnflrc262ad44iiydvn2iptrw__domainkey_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "nmhy3ybmnflrc262ad44iiydvn2iptrw._domainkey.apps.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["nmhy3ybmnflrc262ad44iiydvn2iptrw.dkim.amazonses.com."]
}

resource "aws_route53_record" "apps_gov_tsucoqfortrlk2ht7wowgq642vrg4hjl__domainkey_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "tsucoqfortrlk2ht7wowgq642vrg4hjl._domainkey.apps.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["tsucoqfortrlk2ht7wowgq642vrg4hjl.dkim.amazonses.com."]
}

resource "aws_route53_record" "apps_gov_autodiscover_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "autodiscover.apps.gov."
  type    = "CNAME"
  ttl     = 60
  records = ["autodiscover.mail.us-east-1.awsapps.com."]
}

resource "aws_route53_record" "apps_gov_www_apps_gov_a" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name    = "www.apps.gov."
  type    = "A"
  alias {
    name                   = "d24f99alwtdu0h.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

output "apps_gov_ns" {
  value = "${aws_route53_zone.apps_gov_zone.name_servers}"
}
