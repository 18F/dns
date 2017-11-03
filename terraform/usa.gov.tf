resource "aws_route53_zone" "usa_gov_zone" {
  name = "usa.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "usa_gov_analytics_usa_gov_a" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name = "analytics.usa.gov."
  type = "A"
  alias {
    name = "dkm80j4hktly2.cloudfront.net."
    zone_id = "${aws_route53_zone.primary.zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "usa_gov_analytics_usa_gov_aaaa" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name = "analytics.usa.gov."
  type = "AAAA"
  alias {
    name = "dkm80j4hktly2.cloudfront.net."
    zone_id = "${aws_route53_zone.primary.zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "usa_gov_components_standards_usa_gov_a" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name = "components.standards.usa.gov."
  type = "A"
  alias {
    name = "d1trwt77dwz8ml.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "usa_gov_components_standards_usa_gov_aaaa" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name = "components.standards.usa.gov."
  type = "AAAA"
  alias {
    name = "d1trwt77dwz8ml.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "usa_gov_standards_usa_gov_a" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name = "standards.usa.gov."
  type = "A"
  alias {
    name = "d98p4kkshmqgd.cloudfront.net."
    zone_id = "${aws_route53_zone.primary.zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "usa_gov_standards_usa_gov_aaaa" {
  zone_id = "${aws_route53_zone.usa_gov_zone.zone_id}"
  name = "standards.usa.gov."
  type = "AAAA"
  alias {
    name = "d98p4kkshmqgd.cloudfront.net."
    zone_id = "${aws_route53_zone.primary.zone_id}"
    evaluate_target_health = false
  }
}

output "usa_gov_ns" {
  value="${aws_route53_zone.usa_gov_zone.name_servers}"
}
