/*
* routes needed, round 1, just ACME records
*
* _acme-challenge.${DOMAIN} CNAME -> _acme-challenge.${DOMAIN}.external-domains-production.cloud.gov.
*
* Domains:
* 1) staging-covidtest.usa.gov
* 2) route.staging-covidtest.usa.gov
* 3) (east|west).staging-covidtest.usa.gov
* 4) (west(b|c)|east(a|b)).staging-covidtest.usa.gov
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

resource "aws_route53_record" "acme_challenge_west_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.west.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.west.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_westb_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.westb.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.westb.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_westc_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.westc.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.westc.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_east_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.east.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.east.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_easta_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.easta.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.easta.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "acme_challenge_eastb_stagingcovidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "_acme-challenge.eastb.staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.eastb.staging-covidtest.usa.gov.external-domains-production.cloud.gov."]
}

/*
* routes needed, route 2, real live routes
*
* Domains (current idea):
* 1) staging-covidtest.usa.gov -> ALIAS -> cloud front
* 2) 10/10/10/10 weighted routing from route.staging to easta/eastb/westb/westc with configured health checks
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
resource "aws_route53_record" "stagingcovidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "staging-covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "d1i9kn699lecaj.cloudfront.net"
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

# westb direct & health check
resource "aws_route53_record" "westb_stagingcovidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westb.staging-covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "westb_stagingcovidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westb.staging-covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_health_check" "westb_stagingcovidtest_usa_gov_health" {
  fqdn              = "westb.staging-covidtest.usa.gov"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/robots.txt"
  failure_threshold = "2"
  request_interval  = "30"
}

# route -> westb
resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_wb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "wb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westb_stagingcovidtest_usa_gov_health.id
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "route_stagingcovidtest_usa_gov_aaaa_wb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "AAAA"
  set_identifier = "wb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westb_stagingcovidtest_usa_gov_health.id
  alias {
    name                   = "westb-domains-0-1443414084.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}

# westc direct & health check
resource "aws_route53_record" "westc_stagingcovidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westc.staging-covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "westc_stagingcovidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "westc.staging-covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_health_check" "westc_stagingcovidtest_usa_gov_health" {
  fqdn              = "westc.staging-covidtest.usa.gov"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/robots.txt"
  failure_threshold = "2"
  request_interval  = "30"
}

# route -> westc
resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_wc" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "wc"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westc_stagingcovidtest_usa_gov_health.id
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "route_stagingcovidtest_usa_gov_aaaa_wc" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "AAAA"
  set_identifier = "wc"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.westc_stagingcovidtest_usa_gov_health.id
  alias {
    name                   = "westc-domains-0-1827115415.us-gov-west-1.elb.amazonaws.com"
    zone_id                = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}

# recreate easta if/when easta rejoins staging

# eastb direct & health check
resource "aws_route53_record" "eastb_stagingcovidtest_usa_gov_a" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "eastb.staging-covidtest.usa.gov."
  type    = "A"
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "eastb_stagingcovidtest_usa_gov_aaaa" {
  zone_id = aws_route53_zone.usa_gov_zone.zone_id
  name    = "eastb.staging-covidtest.usa.gov."
  type    = "AAAA"
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_health_check" "eastb_stagingcovidtest_usa_gov_health" {
  fqdn              = "eastb.staging-covidtest.usa.gov"
  port              = 443
  type              = "HTTPS"
  resource_path     = "/robots.txt"
  failure_threshold = "2"
  request_interval  = "30"
}

# route -> eastb
resource "aws_route53_record" "route_stagingcovidtest_usa_gov_a_eb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "A"
  set_identifier = "eb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.eastb_stagingcovidtest_usa_gov_health.id
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
resource "aws_route53_record" "route_stagingcovidtest_usa_gov_aaaa_eb" {
  zone_id        = aws_route53_zone.usa_gov_zone.zone_id
  name           = "route.staging-covidtest.usa.gov."
  type           = "AAAA"
  set_identifier = "eb"
  weighted_routing_policy {
    weight = 10
  }
  health_check_id = aws_route53_health_check.eastb_stagingcovidtest_usa_gov_health.id
  alias {
    name                   = "eastb-domains-0-930753903.us-gov-east-1.elb.amazonaws.com"
    zone_id                = "Z166TLBEWOO7G0"
    evaluate_target_health = false
  }
}
