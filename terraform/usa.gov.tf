locals {
  usa_gov_redirect_server = "54.85.132.205"
}

resource "aws_route53_zone" "usa_gov_zone" {
  name = "usa.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "usa_gov_analytics_usa_gov_a" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name    = "analytics.usa.gov."
  type    = "A"
  alias {
    name                   = "dkm80j4hktly2.cloudfront.net."
    zone_id                = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "usa_gov_analytics_usa_gov_aaaa" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name    = "analytics.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "dkm80j4hktly2.cloudfront.net."
    zone_id                = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# USWDS ------------------------------------------------
resource "aws_route53_record" "usa_gov_components_standards_usa_gov_a" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name    = "components.standards.usa.gov."
  type    = "A"
  ttl     = "300"
  records = ["${local.usa_gov_redirect_server}"]
}

resource "aws_route53_record" "usa_gov_standards_usa_gov_a" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name    = "standards.usa.gov."
  type    = "A"
  ttl     = "300"
  records = ["${local.usa_gov_redirect_server}"]
}

output "usa_gov_ns" {
  value = "${aws_route53_zone.usa_gov_zone.name_servers}"
}
