resource "aws_route53_zone" "vote_gov_zone" {
  name = "vote.gov."
  tags = {
    Project = "dns"
  }
}

#
#   ___ _ __ ___  ___ 
#  / __| '_ ` _ \/ __|
# | (__| | | | | \__ \
#  \___|_| |_| |_|___/
#                  
#


#
#      _            
#   __| | _____   __
#  / _` |/ _ \ \ / /
# | (_| |  __/\ V / 
#  \__,_|\___| \_/ 
#
#

resource "aws_route53_record" "dev__acme_challenge_ssg_dev_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.ssg-dev.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.ssg-dev.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "dev__acme_challenge_dev_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.cms-dev.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.cms-dev.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "dev_ssg_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "ssg-dev.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["ssg-dev.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "dev_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "cms-dev.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["cms-dev.vote.gov.external-domains-production.cloud.gov."]
}

#                      _ 
#  _ __  _ __ ___   __| |
# | '_ \| '__/ _ \ / _` |
# | |_) | | | (_) | (_| |
# | .__/|_|  \___/ \__,_|
# |_|                    
#
resource "aws_route53_record" "prod__acme_challenge_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "prod__acme_challenge_www_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.www.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.www.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "prod__acme_challenge_ssg_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.ssg.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.ssg.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "prod__acme_challenge_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.cms.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.cms.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "prod_ssg_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "ssg.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["ssg.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "prod_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "cms.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["cms.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "prod__acme_challenge_beta_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.beta.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.beta.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "prod_beta_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "beta.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["beta.vote.gov.external-domains-production.cloud.gov."]
}

#      _                   
#  ___| |_ __ _  __ _  ___ 
# / __| __/ _` |/ _` |/ _ \
# \__ \ || (_| | (_| |  __/
# |___/\__\__,_|\__, |\___|
#               |___/      
#

resource "aws_route53_record" "stage__acme_challenge_stage_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.cms-stage.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.cms-stage.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "staging__acme_challenge_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.staging.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.staging.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "staging_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "staging.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["staging.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "stage_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "cms-stage.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["cms-stage.vote.gov.external-domains-production.cloud.gov."]
}

#
#  _            _   
# | |_ ___  ___| |_ 
# | __/ _ \/ __| __|
# | ||  __/\__ \ |_ 
#  \__\___||___/\__|
#                   

resource "aws_route53_record" "test__acme_challenge_ssg_test_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.ssg-test.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.ssg-test.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "test__acme_challenge_test_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "_acme-challenge.cms-test.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["_acme-challenge.cms-test.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "test_ssg_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "ssg-test.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["ssg-test.vote.gov.external-domains-production.cloud.gov."]
}

resource "aws_route53_record" "test_cms_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "cms-test.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["cms-test.vote.gov.external-domains-production.cloud.gov."]
}

#
#     __                 
#    / /__ _ __ ___  ___ 
#   / / __| '_ ` _ \/ __|
#  / / (__| | | | | \__ \
# /_/ \___|_| |_| |_|___/
#                       
#

#resource "aws_route53_record" "vote_gov_vote_gov_a" {
#zone_id = aws_route53_zone.vote_gov_zone.zone_id
#name    = "vote.gov."
#type    = "A"
#alias {
#name                   = "d2s5gzwyabrtbd.cloudfront.net"
#zone_id                = local.cloud_gov_cloudfront_zone_id
#evaluate_target_health = false
#}
#}

#resource "aws_route53_record" "vote_gov_vote_gov_aaaa" {
#zone_id = aws_route53_zone.vote_gov_zone.zone_id
#name    = "vote.gov."
#type    = "AAAA"
#alias {
#name                   = "d2s5gzwyabrtbd.cloudfront.net"
#zone_id                = local.cloud_gov_cloudfront_zone_id
#evaluate_target_health = false
#}
#}

resource "aws_route53_record" "vote_gov_01872332dafeeb93b927e2d9e9b2c53d_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "01872332dafeeb93b927e2d9e9b2c53d.vote.gov."
  type    = "CNAME"
  ttl     = 5
  records = ["799928229b505d839d0482696552a70fb9c456e0.comodoca.com."]
}

resource "aws_route53_record" "new_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "new.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["d2fr19uaud3s4h.cloudfront.net."]
}

resource "aws_route53_record" "search_vote_gov_cname" {
  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  name    = "search.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["vote-en.sites.infr.search.usa.gov."]
}

module "vote_gov__email_security" {
  source = "./email_security"

  zone_id = aws_route53_zone.vote_gov_zone.zone_id
  txt_records = [
    local.spf_no_mail,
    "blitz=mu-cbb11232-c5e05a4b-b13f3a3c-060b48f0"
  ]
}

output "vote_gov_ns" {
  value = aws_route53_zone.vote_gov_zone.name_servers
}
