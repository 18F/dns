resource "aws_route53_zone" "digital_toplevel" {
  name = "digital.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "digital_gov_apex" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "digital.gov."
  type = "A"

  alias {
    name = "d2q1i25any8vwy.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "digital_gov_www" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "www.digital.gov."
  type = "A"

  alias {
    name = "d2q1i25any8vwy.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "demo_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "demo.digital.gov."
  type = "A"

  alias {
    name = "d1f2igtqmwwbgm.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# USWDS -------------------------------
# designsystem.digital.gov — A
resource "aws_route53_record" "designsystem_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "designsystem.digital.gov."
  type = "A"
  alias {
    name = "dlu3fkwowya06.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# designsystem.digital.gov — AAAA
resource "aws_route53_record" "designsystem_digital_gov_aaaa" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "designsystem.digital.gov."
  type = "AAAA"
  alias {
    name = "dlu3fkwowya06.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# components.designsystem.digital.gov — A
resource "aws_route53_record" "components_designsystem_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "components.designsystem.digital.gov."
  type = "A"
  alias {
    name = "dxngby1kewpe.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# components.designsystem.digital.gov — AAA
resource "aws_route53_record" "components_designsystem_digital_gov_aaaa" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "components.designsystem.digital.gov."
  type = "AAAA"
  alias {
    name = "dxngby1kewpe.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}


output "digital_ns" {
  value="${aws_route53_zone.digital_toplevel.name_servers}"
}
