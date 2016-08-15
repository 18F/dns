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
    name = "d3vpuvt2i3xyze.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "vote_gov_vote_gov_txt" {
  zone_id = "${aws_route53_zone.vote_gov_zone.zone_id}"
  name = "vote.gov."
  type = "TXT"
  ttl = 300
  records = [""blitz=mu-cbb11232-c5e05a4b-b13f3a3c-060b48f0""]
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
  alias {
    name = "d3vpuvt2i3xyze.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "vote_gov_ns" {
  value="${aws_route53_zone.vote_gov_zone.name_servers}"
}