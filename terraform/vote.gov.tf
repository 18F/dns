resource "aws_route53_zone" "vote_gov_zone" {
  name = "vote.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "vote_gov_vote_gov_a" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "vote.gov."
  type = "A"
  alias {
    name = "d2s5gzwyabrtbd.cloudfront.net"
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "vote_gov_vote_gov_txt" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "vote.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.spf_no_mail}", "blitz=mu-cbb11232-c5e05a4b-b13f3a3c-060b48f0"]
}

resource "aws_route53_record" "vote_gov_01872332dafeeb93b927e2d9e9b2c53d_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "01872332dafeeb93b927e2d9e9b2c53d.vote.gov."
  type = "CNAME"
  ttl = 5
  records = ["799928229b505d839d0482696552a70fb9c456e0.comodoca.com."]
}

resource "aws_route53_record" "vote_gov_www_vote_gov_a" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "www.vote.gov."
  type = "A"
  ttl = 120
  records = ["${local.usa_gov_redirect_server}"]
}

resource "aws_route53_record" "new_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "new.vote.gov."
  type = "CNAME"
  ttl = 120
  records = ["d2fr19uaud3s4h.cloudfront.net."]
}

resource "aws_route53_record" "beta_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "beta.vote.gov."
  type = "CNAME"
  ttl = 120
  records = ["di5gyq0wmd14q.cloudfront.net."]
}

resource "aws_route53_record" "staging_vote_gov_cname" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "staging.vote.gov."
  type = "CNAME"
  ttl = 120
  records = ["d2xt5jilh64q5c.cloudfront.net."]
}

resource "aws_route53_record" "staging_vote_gov_txt" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name: "_acme-challenge.staging.vote.gov."
  type = "TXT"
  ttl = 120
  records = ["P64l_3BEaTCcJ7ZbM2a2H2tMwmGclssoqTiW4RmHPTY"]
}

# BOD / DMARC
resource "aws_route53_record" "vote_gov__dmarc_vote_gov_txt" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "_dmarc.vote.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_reject}"]
}

output "vote_gov_ns" {
  value="${aws_route53_zone.vote_gov_zone.name_servers}"
}
