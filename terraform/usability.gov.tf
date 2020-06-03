# ------------------------------------------
# WELCOME to the DNS records for Usability.gov
# Before making edits, please reach out to #digitalgov (in TTS Slack) or email digitalgov@gsa.gov
# ------------------------------------------


resource "aws_route53_zone" "usability_toplevel" {
  name = "usability.gov"
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "usability_gov_apex" {
  zone_id = "${aws_route53_zone.usability_toplevel.zone_id}"
  name    = "usability.gov."
  type    = "A"

  alias {
    name                   = " d3882ehkypc0dh.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# www.usability.gov — redirects to usability.gov through pages_redirect
resource "aws_route53_record" "usability_gov_www" {
  zone_id = "${aws_route53_zone.usability_toplevel.zone_id}"
  name    = "www.usability.gov."
  type    = "A"

  alias {
    name                   = " d3882ehkypc0dh.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# demo.usability.gov
resource "aws_route53_record" "demo_usability_gov_a" {
  zone_id = "${aws_route53_zone.usability_toplevel.zone_id}"
  name    = "demo.usability.gov."
  type    = "A"

  alias {
    name                   = " d3882ehkypc0dh.cloudfront.net."
    zone_id                = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}


# Compliance and ACME records -------------------------------

# BOD / DMARC
resource "aws_route53_record" "usability_gov__dmarc_usability_gov_txt" {
  zone_id = "${aws_route53_zone.usability_toplevel.zone_id}"
  name    = "_dmarc.usability.gov."
  type    = "TXT"
  ttl     = 300
  records = ["${local.dmarc_reject}"]
}


# ACME Challenge records

# usability.gov TXT / ACME Challenge
resource "aws_route53_record" "usability_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.usability_toplevel.zone_id}"
  name    = "_acme-challenge.usability.gov."
  type    = "TXT"
  ttl     = 120
  records = ["9F_gDwJzeGpnWpbGphx1dLYa2GE9EYZuKCEH-qTck-8"]
}

# demo.usability.gov TXT / ACME Challenge
resource "aws_route53_record" "demo_usability_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.usability_toplevel.zone_id}"
  name    = "_acme-challenge.demo.usability.gov."
  type    = "TXT"
  ttl     = 120
  records = ["9F_gDwJzeGpnWpbGphx1dLYa2GE9EYZuKCEH-qTck-8"]
}


output "usability_ns" {
  value = "${aws_route53_zone.usability_toplevel.name_servers}"
}
