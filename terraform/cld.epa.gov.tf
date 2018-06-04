resource "aws_route53_zone" "cld_epa_gov_zone" {
  name = "cld.epa.gov."

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "cld_epa_gov_cld_epa_gov_a" {
  zone_id = "${aws_route53_zone.cld_epa_gov_zone.zone_id}"
  name    = "cld.epa.gov."
  type    = "A"

  alias {
    name                   = "dualstack.cld-epa-gov-el-elb-1vx5r8b4nx40-1695709490.us-east-1.elb.amazonaws.com."
    zone_id                = "${local.old_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cld_epa_gov_star_cld_epa_gov_a" {
  zone_id = "${aws_route53_zone.cld_epa_gov_zone.zone_id}"
  name    = "*.cld.epa.gov."
  type    = "A"

  alias {
    name                   = "dualstack.cld-epa-gov-el-elb-1vx5r8b4nx40-1695709490.us-east-1.elb.amazonaws.com."
    zone_id                = "${local.old_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cld_epa_gov_727fd0f2717d53b7e842bb638eb4b08b_cld_epa_gov_cname" {
  zone_id = "${aws_route53_zone.cld_epa_gov_zone.zone_id}"
  name    = "727fd0f2717d53b7e842bb638eb4b08b.cld.epa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["15bb28ca361cc33db177c9783c8a6a1c5eea0e12.comodoca.com."]
}

output "cld_epa_gov_ns" {
  value = "${aws_route53_zone.cld_epa_gov_zone.name_servers}"
}
