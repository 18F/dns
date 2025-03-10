resource "aws_route53_zone" "code_toplevel" {
  name = "code.gov"

  tags = {
    Project = "dns"
  }
}


// Wait to deploy cloud.gov external domain service to set apex cloudfront name
# resource "aws_route53_record" "code_gov_apex" {
#   zone_id = aws_route53_zone.code_toplevel.zone_id
#   name    = "code.gov."
#   type    = "A"

#   alias {
#     name                   = "dqziuvpgrykcy.cloudfront.net."
#     zone_id                = local.cloud_gov_cloudfront_zone_id
#     evaluate_target_health = false
#   }
# }

# resource "aws_route53_record" "code_gov_apex_aaaa" {
#   zone_id = aws_route53_zone.code_toplevel.zone_id
#   name    = "code.gov."
#   type    = "AAAA"

#   alias {
#     name                   = "dqziuvpgrykcy.cloudfront.net."
#     zone_id                = local.cloud_gov_cloudfront_zone_id
#     evaluate_target_health = false
#   }
# }

## CNAME Acme Challenge Record for code.gov
resource "aws_route53_record" "code_gov__acme-challenge_code_gov_cname" {
  zone_id = aws_route53_zone.code_toplevel.zone_id
  name    = "_acme-challenge"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.code.gov.external-domains-production.cloud.gov."]

}

## CNAME for www.code.gov
resource "aws_route53_record" "code_gov_www_code_gov_cname" {
  zone_id = aws_route53_zone.code_toplevel.zone_id
  name    = "www"
  type    = "CNAME"

  ttl     = 300
  records = ["www.code.gov.external-domains-production.cloud.gov."]

}

## CNAME Acme Challenge Record for www.code.gov
resource "aws_route53_record" "code_gov__acme-challenge_www_code_gov_cname" {
  zone_id = aws_route53_zone.code_toplevel.zone_id
  name    = "_acme-challenge.www"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.www.code.gov.external-domains-production.cloud.gov."]

}

# resource "aws_route53_record" "code_gov_api_cname" {
#   zone_id = aws_route53_zone.code_toplevel.zone_id
#   name    = "api.code.gov."
#   type    = "CNAME"
#   ttl     = 300
#   records = ["api-code-gov.domains.api.data.gov"]
# }

module "code_gov__email_security" {
  source  = "./email_security"
  zone_id = aws_route53_zone.code_toplevel.zone_id
}

output "code_ns" {
  value = aws_route53_zone.code_toplevel.name_servers
}
