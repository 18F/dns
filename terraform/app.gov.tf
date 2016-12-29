resource "aws_route53_zone" "app_gov_zone" {
  name = "app.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "app_gov_app_gov_a" {
  zone_id = "${aws_route53_zone.app_gov_zone.zone_id}"
  name = "app.gov."
  type = "A"
  alias {
    name = "d1wh5biaq5z7yu.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "app_gov_www_app_gov_a" {
  zone_id = "${aws_route53_zone.app_gov_zone.zone_id}"
  name = "www.app.gov."
  type = "A"
  alias {
    name = "d1wh5biaq5z7yu.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "app_gov_ns" {
  value="${aws_route53_zone.app_gov_zone.name_servers}"
}
