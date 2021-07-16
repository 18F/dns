resource "aws_route53_zone" "findtreatment_toplevel" {
  name = "findtreatment.gov"

  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "findtreatment_apex" {
  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  name    = "findtreatment.gov."
  type    = "A"

  alias {
    name                   = "d3qgag0313dgk2.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "findtreatment_apex_aaaa" {
  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  name    = "findtreatment.gov."
  type    = "AAAA"

  alias {
    name                   = "d3qgag0313dgk2.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "findtreatment_www" {
  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  name    = "www.findtreatment.gov."
  type    = "A"

  alias {
    name                   = "d3qgag0313dgk2.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "findtreatment_www_aaaa" {
  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  name    = "www.findtreatment.gov."
  type    = "AAAA"

  alias {
    name                   = "d3qgag0313dgk2.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "findtreatment_gov__acme-challenge_findtreatment_gov_txt" {
  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  name    = "_acme-challenge.findtreatment.gov."
  type    = "TXT"
  ttl     = 120
  records = ["7mbRC9tnaT3n20pIjnpFZ0WKcQJHxi6Rt7tdJjQaCvc"]
}

resource "aws_route53_record" "findtreatment_www_gov__acme-challenge_findtreatment_gov_txt" {
  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  name    = "_acme-challenge.www.findtreatment.gov."
  type    = "TXT"
  ttl     = 120
  records = ["D0rV3DqJMU-UoUnr2ijbLAWmVScbnnPCPCDj-_5B970"]
}

module "findtreatment_gov__email_security" {
  source = "./email_security"

  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  dmarc_rua = "mailto:hhs@rua.agari.com"
  dmarc_ruf = "mailto:hhs@ruf.agari.com"
}

resource "aws_route53_record" "findtreatment_gov__entrust-challenge_findtreatment_gov_txt" {
  zone_id = aws_route53_zone.findtreatment_toplevel.zone_id
  name    = "_pki-validation.FINDTREATMENT.GOV."
  type    = "TXT"
  ttl     = 120
  records = ["4078-0BF0-FEEC-0B21-AA16-6F89-3758-4EBB"]
}

output "findtreatment_ns" {
  value = aws_route53_zone.findtreatment_toplevel.name_servers
}
