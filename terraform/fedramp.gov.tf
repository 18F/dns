resource "aws_route53_zone" "fedramp_toplevel" {
  name = "fedramp.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "demo_fedramp_gov_a" {
  zone_id = "${aws_route53_zone.fedramp_toplevel.zone_id}"
  name = "demo.fedramp.gov."
  type = "A"

  alias {
    name = "XXXXXXXXXXXXXXX."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "fedramp_ns" {
  value="${aws_route53_zone.fedramp_toplevel.name_servers}"
}
