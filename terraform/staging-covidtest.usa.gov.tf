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
* Domains (original sketch):
* 1) staging-covidtest.usa.gov -> ALIAS -> cloud front
* 2) route.staging-covidtest.usa.gov -> latency-based routing -> regional names west.staging... & east.staging...
* 3) west.staging-covidtest.usa.gov  -> round-robin + health check -> westb and westc
* 4) westb.staging-covidtest.usa.gov -> ALIAS -> westb ALB
*
* Domains (current idea):
* 1) staging-covidtest.usa.gov -> ALIAS -> cloud front
* 2) 50/50 weighted routing from west.staging... aliased to westb and westc ALBs with evaluate_target_health = true
* 3) 50/50 weighted routing from east.staging... aliased to easta and eastb ALBs with evaluate_target_health = true
* 4) latency_routing_policy for route.staging... within us-gov-west-1 and us-gov-east-1
*/

resource "aws_route53_record" "stagingcovidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "staging-covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "d1i9kn699lecaj.cloudfront.net"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "west_stagingcovidtest_usa_gov_a_b" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "west.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "b"
  weighted_routing_policy {
    weight = 50
  }
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "west_stagingcovidtest_usa_gov_a_c" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "west.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "c"
  weighted_routing_policy {
    weight = 50
  }
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_west" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "west"
  latency_routing_policy {
    region = "us-gov-west-1"
  }
  alias {
    name                   = "west.staging-covidtest.usa.gov."
    zone_id                = aws_route53_zone.usa_gov_zone.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "east_route_stagingcovidtest_usa_gov_a_a" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "east.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "a"
  weighted_routing_policy {
    weight = 50
  }
  alias {
    name                   = "easta-domains-0-830640397.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "east_stagingcovidtest_usa_gov_a_b" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "east.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "b"
  weighted_routing_policy {
    weight = 50
  }
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_east" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "east"
  latency_routing_policy {
    region = "us-gov-east-1"
  }
  alias {
    name                   = "east.staging-covidtest.usa.gov."
    zone_id                = aws_route53_zone.usa_gov_zone.zone_id
    evaluate_target_health = true
  }
}
