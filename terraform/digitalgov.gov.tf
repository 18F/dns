resource "aws_route53_zone" "digitalgov_gov_zone" {
  name = "digitalgov.gov."
  tags {
    Project = "dns"
  }
}

# www.digitalgov.gov
resource "aws_route53_record" "www_digitalgov_gov_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "www.digitalgov.gov."
  type = "A"
  alias {
    name = "djce1rrjucuix.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "digitalgov_gov_openopps_digitalgov_gov_cname" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = ["openopps.usajobs.gov."]
}

output "digitalgov_gov_ns" {
  value="${aws_route53_zone.digitalgov_gov_zone.name_servers}"
}
