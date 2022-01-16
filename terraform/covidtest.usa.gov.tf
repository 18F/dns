/*
* routes needed, round 1, just ACME records
*
* _acme-challenge.${DOMAIN} CNAME -> _acme-challenge.${DOMAIN}.external-domains-production.cloud.gov.
*
* Domains:
* 1) covidtest.usa.gov
* 2) route.covidtest.usa.gov
* 3) (east|west).covidtest.usa.gov
* 4) (west(b|c)|east(a|b)).covidtest.usa.gov
*/

resource "aws_route53_record" "acme_challenge_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_route_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.route.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.route.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_west_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.west.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.west.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_westb_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.westb.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.westb.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_westc_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.westc.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.westc.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_east_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.east.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.east.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_easta_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.easta.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.easta.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_eastb_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.eastb.covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.eastb.covidtest.usa.gov.external-domains-production.cloud.gov."]
}

/*
* routes needed, route 2, real live routes
*
* Domains (current idea):
* 1) covidtest.usa.gov -> ALIAS -> cloud front
* 2) 10/10/10/10 weighted routing from route... to easta/eastb/westb/westc with configured health checks
*/

resource "aws_route53_record" "covidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "dncvgqeo9peie.cloudfront.net"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "covidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "dncvgqeo9peie.cloudfront.net"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

# westb direct & health check
resource "aws_route53_record" "westb_covidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westb.covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "westb_covidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westb.covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_health_check" "westb_covidtest_usa_gov_health" {
  fqdn              = "westb.covidtest.usa.gov"
  port              = 443
  type              = "HTTPS_STR_MATCH"
  resource_path     = "/"
  search_string     = "COVIDtests.gov"
  failure_threshold = "2"
  request_interval  = "30"
}

# route -> westb
resource "aws_route53_record" "route_covidtest_usa_gov_a_wb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "A"
  set_identifier = "wb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westb_covidtest_usa_gov_health.id
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "route_covidtest_usa_gov_aaaa_wb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "AAAA"
  set_identifier = "wb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westb_covidtest_usa_gov_health.id
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}

# westc direct & health check
resource "aws_route53_record" "westc_covidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westc.covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "westc_covidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westc.covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_health_check" "westc_covidtest_usa_gov_health" {
  fqdn              = "westc.covidtest.usa.gov"
  port              = 443
  type              = "HTTPS_STR_MATCH"
  resource_path     = "/"
  search_string     = "COVIDtests.gov"
  failure_threshold = "2"
  request_interval  = "30"
}

# route -> westc
resource "aws_route53_record" "route_covidtest_usa_gov_a_wc" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "A"
  set_identifier = "wc"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westc_covidtest_usa_gov_health.id
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "route_covidtest_usa_gov_aaaa_wc" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "AAAA"
  set_identifier = "wc"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westc_covidtest_usa_gov_health.id
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}

# easta direct & health check
resource "aws_route53_record" "easta_covidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "easta.covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "easta-domains-0-830640397.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "easta_covidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "easta.covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "easta-domains-0-830640397.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_health_check" "easta_covidtest_usa_gov_health" {
  fqdn              = "easta.covidtest.usa.gov"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/"
  search_string     = "COVIDtests.gov"
  failure_threshold = "2"
  request_interval  = "30"
}

# route -> easta
resource "aws_route53_record" "route_covidtest_usa_gov_a_ea" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "A"
  set_identifier = "ea"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.easta_covidtest_usa_gov_health.id
  alias {
    name                   = "easta-domains-0-830640397.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = true
  }
}
resource "aws_route53_record" "route_covidtest_usa_gov_aaaa_ea" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "AAAA"
  set_identifier = "ea"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.easta_covidtest_usa_gov_health.id
  alias {
    name                   = "easta-domains-0-830640397.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = true
  }
}

# eastb direct & health check
resource "aws_route53_record" "eastb_covidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "eastb.covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "eastb_covidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "eastb.covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_health_check" "eastb_covidtest_usa_gov_health" {
  fqdn              = "eastb.covidtest.usa.gov"
  port              = 443
  type              = "HTTPS_STR_MATCH"
  resource_path     = "/"
  search_string     = "COVIDtests.gov"
  failure_threshold = "2"
  request_interval  = "30"
}

# route -> eastb
resource "aws_route53_record" "route_covidtest_usa_gov_a_eb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "A"
  set_identifier = "eb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.eastb_covidtest_usa_gov_health.id
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "route_covidtest_usa_gov_aaaa_eb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.covidtest.usa.gov."
  type           = "AAAA"
  set_identifier = "eb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.eastb_covidtest_usa_gov_health.id
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
