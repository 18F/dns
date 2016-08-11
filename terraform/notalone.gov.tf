resource "aws_route53_zone" "notalone_gov_zone" {
  name = "notalone.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "notalone_gov_notalone_gov_a" {
  zone_id = "${aws_route53_zone.notalone_gov_zone.zone_id}"
  name = "notalone.gov."
  type = "A"
  alias {
    name = "d2q5lc8uxbhy2z.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "notalone_gov_fd154312b70d9ee7c54cbce1ea04ef49_notalone_gov_cname" {
  zone_id = "${aws_route53_zone.notalone_gov_zone.zone_id}"
  name = "fd154312b70d9ee7c54cbce1ea04ef49.notalone.gov."
  type = "CNAME"
  ttl = 5
  records = ["833da73df4b6862309a25c0d80341ae36d5ae459.comodoca.com."]
}

resource "aws_route53_record" "notalone_gov_www_notalone_gov_cname" {
  zone_id = "${aws_route53_zone.notalone_gov_zone.zone_id}"
  name = "www.notalone.gov."
  type = "CNAME"
  ttl = 300
  records = ["d2q5lc8uxbhy2z.cloudfront.net"]
}

output "notalone_gov_ns" {
  value="${aws_route53_zone.notalone_gov_zone.name_servers}"
}