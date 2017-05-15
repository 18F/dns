resource "aws_route53_record" "transition_gov_transition_gov_cname" {
  zone_id = "${aws_route53_zone.transition_gov_us_zone.zone_id}"
  name = "transition.fec.gov"
  type = "A"
  alias {
    name = "d2p6ccc3xlipxg.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "fec_gov_cname" {
  zone_id = "${aws_route53_zone.transition_gov_us_zone.zone_id}"
  name = "www.fec.gov"
  type = "A"
  alias {
    name = "d3t5a36r5g3qx4.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "transition_gov_us_ns" {
  value="${aws_route53_zone.transition_gov_us_zone.name_servers}"
}
