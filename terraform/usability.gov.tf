# ------------------------------------------
# WELCOME to the DNS records for Usability.gov
# Before making edits, please reach out to #digitalgov (in TTS Slack) or email digitalgov@gsa.gov
# ------------------------------------------

resource "aws_route53_zone" "usability_toplevel" {
  name = "usability.gov"
  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "usability_gov_apex" {
  zone_id = aws_route53_zone.usability_toplevel.zone_id
  name    = "usability.gov."
  type    = "A"

  alias {
    name                   = "d2yghjaoiuwpg5.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "usability_gov_apex_aaaa" {
  zone_id = aws_route53_zone.usability_toplevel.zone_id
  name    = "usability.gov."
  type    = "AAAA"

  alias {
    name                   = "d2yghjaoiuwpg5.cloudfront.net."
    zone_id                = local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}

# www.usability.gov — redirects to usability.gov through pages_redirect
resource "aws_route53_record" "usability_gov_www" {
  zone_id = aws_route53_zone.usability_toplevel.zone_id
  name    = "www.usability.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["d3882ehkypc0dh.cloudfront.net."]
}

# Compliance and ACME records -------------------------------

module "usability_gov__email_security" {
  source  = "./email_security"
  zone_id = aws_route53_zone.usability_toplevel.zone_id
}

# ACME Challenge records

# www.usability.gov TXT / ACME Challenge
resource "aws_route53_record" "www_usability_gov__acme-challenge_txt" {
  zone_id = aws_route53_zone.usability_toplevel.zone_id
  name    = "_acme-challenge.www.usability.gov."
  type    = "TXT"
  ttl     = 120
  records = ["9F_gDwJzeGpnWpbGphx1dLYa2GE9EYZuKCEH-qTck-8"]
}

# usability.gov TXT / ACME Challenge
resource "aws_route53_record" "usability_gov__acme-challenge_txt" {
  zone_id = aws_route53_zone.usability_toplevel.zone_id
  name    = "_acme-challenge.usability.gov."
  type    = "TXT"
  ttl     = 120
  records = ["mHs3DO2svQSyyvxRfnBP-vlV-ErJr9naPCxhnY_HADI"]
}

output "usability_ns" {
  value = aws_route53_zone.usability_toplevel.name_servers
}

# redirect www.usability.gov to wwww.digital.gov/topics/usability
#module "d_18f_gov__join_18f_gov_redirect" {
#  source  = "mediapop/redirect/aws"
#  version = "1.2.1"
#
#  domains = {
#    "usability.gov." = ["usability.gov"]
#  }
#
#  redirect_to = "https://www.digital.gov/topics/usability"
#}
