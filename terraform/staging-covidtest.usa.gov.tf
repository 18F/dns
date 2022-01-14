/*
* routes needed, round 1, just ACME records
*
* _acme-challenge.${DOMAIN} CNAME -> _acme-challenge.${DOMAIN}.external-domains-production.cloud.gov.
*
* Domains:
* 1) staging-covidtest.usa.gov
* 2) route.staging-covidtest.usa.gov
* 3) westb.staging-covidtest.usa.gov
*/

resource "aws_route53_record" "acme_challenge_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_route_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.route.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.route.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_westb_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.westb.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.westb.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

/*
* routes needed, route 2, real live routes
*
* Domains:
* 1) staging-covidtest.usa.gov -> ALIAS -> cloud front
* 2) route.staging-covidtest.usa.gov -> latency-based routing -> regional names west.staging... & east.staging...
* 3) west.staging-covidtest.usa.gov  -> round-robin + health check -> westb and westc
* 4) westb.staging-covidtest.usa.gov -> ALIAS -> westb ALB
*/

resource "aws_route53_record" "stagingcovidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "staging-covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "TKTK"
    zone_id                = local.cloud_gov_cloudfront_zone_id // TKTK is this correct, or do we need a new one
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_westb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "west-b"
  latency_routing_policy {
    region = "us-gov-west-1"
  }
  alias {
    name                   = "TKTK-westb-alb"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_westc" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "west-c"
  latency_routing_policy {
    region = "us-gov-west-1"
  }
  alias {
    name                   = "TKTK-westc-alb"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_easta" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "east-a"
  latency_routing_policy {
    region = "us-gov-east-1"
  }
  alias {
    name                   = "TKTK-easta-alb"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_eastb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "east-b"
  latency_routing_policy {
    region = "us-gov-east-1"
  }
  alias {
    name                   = "TKTK-eastb-alb"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = true
  }
}

# resource "aws_route53_record" "westb_stagingcovidtest_usa_gov_a" {
#   zone_id = aws_route53_zone.usa_gov_zone.zone_id
#   name = "westb.staging-covidtest.usa.gov."
#   type = "A"
#   alias {
#     name = "TKTK ALB"
#     zone_id = local.cloud_gov_cloudfront_zone_id
#     evaluate_target_health = true
#   }
# }
#
# resource "aws_route53_record" "westb_stagingcovidtest_usa_gov_aaaa" {
#   zone_id = aws_route53_zone.usa_gov_zone.zone_id
#   name = "westb.staging-covidtest.usa.gov."
#   type = "AAAA"
#   alias {
#     name = "TKTK ALB"
#     zone_id = local.cloud_gov_cloudfront_zone_id
#     evaluate_target_health = true
#   }
# }
