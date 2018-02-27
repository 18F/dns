resource "aws_route53_zone" "code_toplevel" {
  name = "code.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "code_gov_apex" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "code.gov."
  type = "A"

  alias {
    name = "dqziuvpgrykcy.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "code_gov_www" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "www.code.gov."
  type = "A"

  alias {
    name = "dqziuvpgrykcy.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "staging_code_gov_a" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "staging.code.gov."
  type = "A"

  alias {
    name = "d3g0jy911fqt1l.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "staging_code_gov_a" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "developers.code.gov."
  type = "A"

  alias {
    name = "d3jsj3d37agtw.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "code_gov_api_cname" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "api.code.gov."
  type = "CNAME"
  ttl = 300
  records = ["api-code-gov.domains.api.data.gov"]
}


output "code_ns" {
  value="${aws_route53_zone.code_toplevel.name_servers}"
}
