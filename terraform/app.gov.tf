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
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "app_gov_www_app_gov_a" {
  zone_id = "${aws_route53_zone.app_gov_zone.zone_id}"
  name = "www.app.gov."
  type = "A"
  alias {
    name = "d1wh5biaq5z7yu.cloudfront.net"
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "app_gov_app_gov_txt" {
  zone_id = "${aws_route53_zone.app_gov_zone.zone_id}"
  name = "app.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.spf_no_mail}"]
}

resource "aws_route53_record" "app_gov__dmarc_app_gov_txt" {
  zone_id = "${aws_route53_zone.app_gov_zone.zone_id}"
  name = "_dmarc.app.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_10}"]
}

output "app_gov_ns" {
  value="${aws_route53_zone.app_gov_zone.name_servers}"
}
