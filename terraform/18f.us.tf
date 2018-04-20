resource "aws_route53_zone" "18f_us_zone" {
  name = "18f.us."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "18f_us_test_18f_us_cname" {
  zone_id = "${aws_route53_zone.18f_us_zone.zone_id}"
  name = "test.18f.us."
  type = "CNAME"
  ttl = 300
  records = ["dualstack.production-cloudfoundry-apps-1374881977.us-gov-west-1.elb.amazonaws.com."]
}

output "18f_us_ns" {
  value="${aws_route53_zone.18f_us_zone.name_servers}"
}
