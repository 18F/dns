resource "aws_route53_zone" "search_toplevel" {
  name = "search.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "search_gov_apex" {
  zone_id = "${aws_route53_zone.search_toplevel.zone_id}"
  name = "search.gov."
  type = "A"

  alias {
    name = "dcp2c9fh8vtdl.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# www.search.gov — redirects to search.gov through pages_redirect
resource "aws_route53_record" "search_gov_www" {
  zone_id = "${aws_route53_zone.search_toplevel.zone_id}"
  name = "www.search.gov."
  type = "A"

  alias {
    name = "dv0x4a4ilr842.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# find.search.gov
resource "aws_route53_record" "search_gov_find" {
  zone_id = "${aws_route53_zone.search_toplevel.zone_id}"
  name = "find.search.gov."
  type = "CNAME"
  ttl = 5
  records = ["search.usa.gov."]
}

# admin-center-downtime.search.gov
resource "aws_route53_record" "search_gov_downtime" {
  zone_id = "${aws_route53_zone.search_toplevel.zone_id}"
  name = "admin-center-downtime.search.gov."
  type = "A"
  records = ["34.238.89.30"]
  ttl     = "300"
}

# Email
resource "aws_route53_record" "search_gov_mx" {
  zone_id = "${aws_route53_zone.search_toplevel.zone_id}"
  name = "search.gov."
  type = "MX"
  ttl = 300
  records = ["10 inbound-smtp.us-east-1.amazonaws.com."]
}

resource "aws_route53_record" "search_gov__amazonses_search_gov_txt" {
  zone_id = "${aws_route53_zone.search_toplevel.zone_id}"
  name = "_amazonses.search.gov."
  type = "TXT"
  ttl = 300
  records = ["bhZh0ZXP7e8vJ1zeTFVBUn/n1rE5NHWBzOIgVG71swI="]
}

module "search_gov__email_security" {
  source = "./email_security"

  zone_id = "${aws_route53_zone.search_toplevel.zone_id}"
  txt_records = ["v=spf1 include:amazonses.com include:mail.zendesk.com include:_spf.google.com -all"]
}

output "search_ns" {
  value="${aws_route53_zone.search_toplevel.name_servers}"
}
