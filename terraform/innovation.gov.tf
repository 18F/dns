resource "aws_route53_zone" "innovation_toplevel" {
  name = "innovation.gov"

  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "innovation_gov_apex" {
  zone_id = aws_route53_zone.innovation_toplevel.zone_id
  name    = "innovation.gov."
  type    = "A"

  alias {
    name                   = "d2ntl68ywjm643.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "innovation_gov_apex_aaaa" {
  zone_id = aws_route53_zone.innovation_toplevel.zone_id
  name    = "innovation.gov."
  type    = "AAAA"

  alias {
    name                   = "d2ntl68ywjm643.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "innovation_gov_www" {
  zone_id = aws_route53_zone.innovation_toplevel.zone_id
  name    = "www.innovation.gov."
  type    = "A"

  alias {
    name                   = "d2ntl68ywjm643.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "innovation_gov_www_aaaa" {
  zone_id = aws_route53_zone.innovation_toplevel.zone_id
  name    = "www.innovation.gov."
  type    = "AAAA"

  alias {
    name                   = "d2ntl68ywjm643.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "demo_innovation_gov_a" {
  zone_id = aws_route53_zone.innovation_toplevel.zone_id
  name    = "demo.innovation.gov."
  type    = "A"

  alias {
    name                   = "d3am9l7wwd0yie.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "demo_innovation_gov_aaaa" {
  zone_id = aws_route53_zone.innovation_toplevel.zone_id
  name    = "demo.innovation.gov."
  type    = "AAAA"

  alias {
    name                   = "d3am9l7wwd0yie.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

module "innovation_gov__email_security" {
  source  = "./email_security"
  zone_id = aws_route53_zone.innovation_toplevel.zone_id
}

output "innovation_ns" {
  value = aws_route53_zone.innovation_toplevel.name_servers
}
