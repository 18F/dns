resource "aws_route53_zone" "open_fec_gov_zone" {
  name = "open.fec.gov."

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "open_fec_gov_open_fec_gov_a" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "open.fec.gov."
  type    = "A"

  alias {
    name                   = "dualstack.fec-cf-elb-elb-obe91x3x1ejs-1507253565.us-east-1.elb.amazonaws.com."
    zone_id                = "${local.elb_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "open_fec_gov_api-stage_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "api-stage.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["api-open-fec-2086140464.us-east-1.elb.amazonaws.com."]
}

resource "aws_route53_record" "open_fec_gov_api_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "api.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["api-open-fec-2086140464.us-east-1.elb.amazonaws.com."]
}

resource "aws_route53_record" "open_fec_gov_a33103137e39f452e19e75a2bd2ccb02_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "a33103137e39f452e19e75a2bd2ccb02.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["198e0728a29b521ce35ec20143c475fda6b2c9e2.comodoca.com."]
}

resource "aws_route53_record" "open_fec_gov_d59763b6a0d2ba601eecf90cc4085dd8_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "d59763b6a0d2ba601eecf90cc4085dd8.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["3729c0fa72e09e1e7830e1e91de34c2c1d0f61f6.comodoca.com."]
}

resource "aws_route53_record" "open_fec_gov_goldengate-dev-replica_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "goldengate-dev-replica.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["fec-goldengate-dev-replica.ch0moygcdwsl.us-east-1.rds.amazonaws.com."]
}

resource "aws_route53_record" "open_fec_gov_goldengate-dev_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "goldengate-dev.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["fec-goldengate-dev-2015-08-28.ch0moygcdwsl.us-east-1.rds.amazonaws.com."]
}

resource "aws_route53_record" "open_fec_gov_goldengate-prod-replica_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "goldengate-prod-replica.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["fec-goldengate-target-replica.ch0moygcdwsl.us-east-1.rds.amazonaws.com."]
}

resource "aws_route53_record" "open_fec_gov_goldengate-staging_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "goldengate-staging.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["fec-goldengate-stage-2015-06-10.ch0moygcdwsl.us-east-1.rds.amazonaws.com."]
}

resource "aws_route53_record" "open_fec_gov_goldengate_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "goldengate.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["fec-goldengate-target-2015-08-05.ch0moygcdwsl.us-east-1.rds.amazonaws.com."]
}

output "open_fec_gov_ns" {
  value = "${aws_route53_zone.open_fec_gov_zone.name_servers}"
}
