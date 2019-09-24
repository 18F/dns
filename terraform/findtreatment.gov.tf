resource "aws_route53_zone" "findtreatment_toplevel" {
  name = "findtreatment.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "findtreatment_apex" {
  zone_id = "${aws_route53_zone.findtreatment_toplevel.zone_id}"
  name = "findtreatment.gov."
  type = "A"

  alias {
    name = "d10kloqvw02pp7.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "findtreatment_www" {
  zone_id = "${aws_route53_zone.findtreatment_toplevel.zone_id}"
  name = "www.findtreatment.gov."
  type = "A"

  alias {
    name = "d10kloqvw02pp7.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "findtreatment_gov__acme-challenge_findtreatment_gov_txt" {
  zone_id = "${aws_route53_zone.findtreatment_toplevel.zone_id}"
  name = "_acme-challenge.findtreatment.gov."
  type = "TXT"
  ttl = 120
  records = ["-ACFTrV79Gk-IFUGyxZ0rX4mcjmSQ3v0sL1mSqjwSnM"]
}

# BOD
resource "aws_route53_record" "findtreatment_gov__dmarc_findtreatment_gov_txt" {
  zone_id = "${aws_route53_zone.findtreatment_toplevel.zone_id}"
  name = "_dmarc.findtreatment.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_reject}"]
}


output "findtreatment_ns" {
  value="${aws_route53_zone.findtreatment_toplevel.name_servers}"
}
