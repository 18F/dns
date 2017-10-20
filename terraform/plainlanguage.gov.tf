resource "aws_route53_zone" "plainlanguage_toplevel" {
  name = "plainlanguage.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "plainlanguage_apex" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name = "plainlanguage.gov."
  type = "A"

  alias {
    name = "XXXXXXXXXXXX."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "plainlanguage_www" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name = "www.plainlanguage.gov."
  type = "A"

  alias {
    name = "XXXXXXXXXXXXXX."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "demo_plainlanguage_a" {
  zone_id = "${aws_route53_zone.plainlanguage_toplevel.zone_id}"
  name = "demo.plainlanguage.gov."
  type = "A"

  alias {
    name = "XXXXXXXXXXXXXX."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "plainlanguage_ns" {
  value="${aws_route53_zone.plainlanguage_toplevel.name_servers}"
}
