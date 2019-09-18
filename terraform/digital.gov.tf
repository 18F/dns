# ------------------------------------------
# WELCOME to the DNS records for Digital.gov
# Before making edits, please reach out to #digitalgov (in TTS Slack) or email digitalgov@gsa.gov
# ------------------------------------------


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

# workflow.digital.gov
resource "aws_route53_record" "workflow_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "workflow.digital.gov."
  type = "A"

  alias {
    name = "d1m1gatn2ksd43.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# USWDS - U.S. Web Design System -------------------------------
# designsystem.digital.gov — A
# (Master site in Federalist)
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
# (Master site in Federalist)
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

# v2.designsystem.digital.gov — A -------------------------------
# (Redirects to designsystem.digital.gov via "pages redirect")
resource "aws_route53_record" "v2_designsystem_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "v2.designsystem.digital.gov."
  type = "A"
  alias {
    name = "d1w7m7a89ly0cw.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# v2alt.designsystem.digital.gov — A -------------------------------
# (Redirects to designsystem.digital.gov via "pages redirect")
resource "aws_route53_record" "v2alt_designsystem_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "v2alt.designsystem.digital.gov."
  type = "A"
  alias {
    name = "d1w7m7a89ly0cw.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# v1.designsystem.digital.gov — A -------------------------------
# (DEMO site in Federalist)
resource "aws_route53_record" "v1_designsystem_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "v1.designsystem.digital.gov."
  type = "A"
  alias {
    name = "d5bhevr9bklr9.cloudfront.net."
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

# public-sans.digital.gov — A
resource "aws_route53_record" "public_sans_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "public-sans.digital.gov."
  type = "A"
  alias {
    name = "d30jruftdogur6.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}


# Digital.gov Guides -------------------------------
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

# pra.digital.gov — A -------------------------------
resource "aws_route53_record" "pra_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "pra.digital.gov."
  type = "A"
  alias {
    name = "d3vwm5h0acan67.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# demo.pra.digital.gov — A -------------------------------
resource "aws_route53_record" "demo_pra_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "demo.pra.digital.gov."
  type = "A"
  alias {
    name = "d18cp08a73t0c1.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}


# Touchpoints -------------------------------
# A customer service tool for federal agencies that helps them improve the quality of service they deliver to their customers
# Contact feedback-analytics@gsa.gov or digitalgov@gsa.gov

# DEMO Touchpoints Site / Federalist / demo.touchpoints.digital.gov — A
resource "aws_route53_record" "demo_touchpoints_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name =  "demo.touchpoints.digital.gov."
  type = "A"
  alias {
    name = "dcxk3q3d8gzx7.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# Touchpoints Site / Federalist / touchpoints.digital.gov — A
resource "aws_route53_record" "touchpoints_digital_gov_a" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "touchpoints.digital.gov."
  type = "A"
  alias {
    name = "d5n0pmq4ueiac.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}



# Compliance and ACME records -------------------------------

# BOD
resource "aws_route53_record" "digital_gov_dmarc_digital_gov_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "digital.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.spf_no_mail}"]
}

# v2.designsystem.digital.gov TXT / ACME Challenge
resource "aws_route53_record" "v2_designsystem_digital_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_acme-challenge.v2.designsystem.digital.gov."
  type = "TXT"
  ttl = 120
  records = ["bvOg0Ymz76YopI5rRn0Z_a77TLTKIW58mb0hHPBY_Rs"]
}

# v2alt.designsystem.digital.gov TXT (TEMPORARY)
resource "aws_route53_record" "v2alt_designsystem_digital_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_acme-challenge.v2alt.designsystem.digital.gov."
  type = "TXT"
  ttl = 120
  records = ["4kIMhG7RfNmvTFFwadOCHlfSCWhhIIGiyWwArqWPQ3E"]
}

# v1.designsystem.digital.gov TXT / ACME Challenge
resource "aws_route53_record" "v1_designsystem_digital_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_acme-challenge.v1.designsystem.digital.gov."
  type = "TXT"
  ttl = 120
  records = ["wIZIo5wxeXxLDnhBrd7qhaC7QTpU9ko7HsyL226CRkc"]
}

# pra.digital.gov TXT / ACME Challenge
resource "aws_route53_record" "pra_digital_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_acme-challenge.pra.digital.gov."
  type = "TXT"
  ttl = 120
  records = ["0VxlpUbA2CXBDx1GKUlr-SujwU0ep9KvGrM0BvE6o4E"]
}

# demo.pra.digital.gov TXT / ACME Challenge
resource "aws_route53_record" "demo_pra_digital_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_acme-challenge.demo.pra.digital.gov."
  type = "TXT"
  ttl = 120
  records = ["qzIXA_qU7a3io8b_FRxFVbPBUKZ83XtglufzS7qKnlg"]
}

resource "aws_route53_record" "digital_gov__dmarc_digital_gov_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_dmarc.digital.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_reject}"]
}

# demo.touchpoints.digital.gov TXT / ACME Challenge
resource "aws_route53_record" "demo_touchpoints_digital_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_acme-challenge.demo.touchpoints.digital.gov."
  type = "TXT"
  ttl = 120
  records = ["n77f2RwJfGyS0NuSm-qIaf0FZEEURhqEACLML32hV0Y"]
}

# touchpoints.digital.gov TXT / ACME Challenge
resource "aws_route53_record" "touchpoints_digital_gov__acme-challenge_txt" {
  zone_id = "${aws_route53_zone.digital_toplevel.zone_id}"
  name = "_acme-challenge.touchpoints.digital.gov."
  type = "TXT"
  ttl = 120
  records = ["Ho5lFIaJK7J44nLyBWGpfMBRNc96eL7-QnMuBII-4Uc"]
}

output "digital_ns" {
  value="${aws_route53_zone.digital_toplevel.name_servers}"
}
