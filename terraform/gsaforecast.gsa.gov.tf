resource "aws_route53_zone" "gsaforecast_gsa_gov_zone" {
  name = "gsaforecast.gsa.gov."

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "gsaforecast_gsa_gov_gsaforecast_gsa_gov_a" {
  zone_id = "${aws_route53_zone.gsaforecast_gsa_gov_zone.zone_id}"
  name    = "gsaforecast.gsa.gov."
  type    = "A"

  alias {
    name                   = "dualstack.gsaforecast-gsa-gov-34157864.us-east-1.elb.amazonaws.com."
    zone_id                = "${local.elb_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "gsaforecast_gsa_gov_7575ddfce54082fe732d00e132bb2340_gsaforecast_gsa_gov_cname" {
  zone_id = "${aws_route53_zone.gsaforecast_gsa_gov_zone.zone_id}"
  name    = "7575ddfce54082fe732d00e132bb2340.gsaforecast.gsa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["6e8adb27ac503c17cd79c9c6f35e7c0f2ea69d53.comodoca.com."]
}

output "gsaforecast_gsa_gov_ns" {
  value = "${aws_route53_zone.gsaforecast_gsa_gov_zone.name_servers}"
}
