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
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# www.digital.gov — redirects to digital.gov through pages_redirect
resource "aws_route53_record" "digital_gov_www" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "www.digital.gov."
  type = "A"

  alias {
    name = "d11gdxqvugzxkr.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# demo.digital.gov
resource "aws_route53_record" "demo_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "demo.digital.gov."
  type = "A"

  alias {
    name = "d1f2igtqmwwbgm.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
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
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
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
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
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
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
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
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# v2.designsystem.digital.gov — A -------------------------------
resource "aws_route53_record" "v2_designsystem_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "v2.designsystem.digital.gov."
  type = "A"
  alias {
    name = "d3pcqg083enklv.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# emerging.digital.gov — A -------------------------------
resource "aws_route53_record" "emerging_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "emerging.digital.gov."
  type = "A"
  alias {
    name = "d2b40qcr6kbxp7.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# accessibility.digital.gov — A -------------------------------
resource "aws_route53_record" "accessibility_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "accessibility.digital.gov."
  type = "A"
  alias {
    name = "d2hlc5rjmtb40x.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# demo.accessibility.digital.gov — A -------------------------------
resource "aws_route53_record" "demo_accessibility_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "demo.accessibility.digital.gov."
  type = "A"
  alias {
    name = "dnt48lkpo0ew7.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}


# BOD
resource "aws_route53_record" "digital_gov_dmarc_digital_gov_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "digital.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.spf_no_mail}"]
}

resource "aws_route53_record" "digital_gov__dmarc_digital_gov_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_dmarc.digital.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_reject}"]
}

output "digital_ns" {
  value="${aws_route53_zone.digital_toplevel.name_servers}"
}
