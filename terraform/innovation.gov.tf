resource "aws_route53_zone" "innnovation_toplevel" {
  name = "innnovation.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "innnovation_gov_apex" {
  zone_id = "${aws_route53_zone.innnovation_toplevel.zone_id}"
  name = "innnovation.gov."
  type = "A"

  alias {
    name = "d2q1i25any8vwy.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "innnovation_gov_www" {
  zone_id = "${aws_route53_zone.innnovation_toplevel.zone_id}"
  name = "www.innnovation.gov."
  type = "A"

  alias {
    name = "d2q1i25any8vwy.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "demo_innnovation_gov_a" {
  zone_id = "${aws_route53_zone.innnovation_toplevel.zone_id}"
  name = "demo.innnovation.gov."
  type = "A"

  alias {
    name = "d1f2igtqmwwbgm.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "innnovation_ns" {
  value="${aws_route53_zone.innnovation_toplevel.name_servers}"
}
