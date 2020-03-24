resource "aws_route53_zone" "vote_gov_zone" {
  name = "vote.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "vote_gov_vote_gov_a" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "vote.gov."
  type    = "A"
  alias {
    name                   = "d2s5gzwyabrtbd.cloudfront.net"
    zone_id                = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "vote_gov_vote_gov_txt" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "vote.gov."
  type    = "TXT"
  ttl     = 300
  records = ["${local.spf_no_mail}", "blitz=mu-cbb11232-c5e05a4b-b13f3a3c-060b48f0"]
}

resource "aws_route53_record" "vote_gov_01872332dafeeb93b927e2d9e9b2c53d_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "01872332dafeeb93b927e2d9e9b2c53d.vote.gov."
  type    = "CNAME"
  ttl     = 5
  records = ["799928229b505d839d0482696552a70fb9c456e0.comodoca.com."]
}

module "vote_gov__www_vote_gov_redirect" {
  source = "mediapop/redirect/aws"
  version = "1.2.0"

  domains = {
    "vote.gov." = ["www.vote.gov"]
  }

  redirect_to = "vote.gov"
}

resource "aws_route53_record" "new_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "new.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["d2fr19uaud3s4h.cloudfront.net."]
}

resource "aws_route53_record" "beta_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "beta.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["di5gyq0wmd14q.cloudfront.net."]
}

resource "aws_route53_record" "staging_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "staging.vote.gov."
  type    = "CNAME"
  ttl     = 120
  records = ["d3rjcr7wk6cbst.cloudfront.net."]
}

resource "aws_route53_record" "staging_vote_gov_txt" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "_acme-challenge.staging.vote.gov."
  type    = "TXT"
  ttl     = 120
  records = ["-IQdOpZZcQmMfAedslZpwYCbAsFPC92MLVyVzh53uqc"]
}

# BOD / DMARC
resource "aws_route53_record" "vote_gov__dmarc_vote_gov_txt" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name    = "_dmarc.vote.gov."
  type    = "TXT"
  ttl     = 300
  records = ["${local.dmarc_reject}"]
}

output "vote_gov_ns" {
  value = "${aws_route53_zone.vote_gov_zone.name_servers}"
}
