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
}

resource "aws_route53_record" "open_fec_gov_api-stage_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "api-stage.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["api-open-fec-gov.domains.api.data.gov."]
}

resource "aws_route53_record" "open_fec_gov_api_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "api.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["api-open-fec-gov.domains.api.data.gov."]
}

resource "aws_route53_record" "open_fec_gov_a33103137e39f452e19e75a2bd2ccb02_api_open_fec_gov_cname" {
  zone_id = "${aws_route53_zone.open_fec_gov_zone.zone_id}"
  name    = "a33103137e39f452e19e75a2bd2ccb02.api.open.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["198e0728a29b521ce35ec20143c475fda6b2c9e2.comodoca.com."]
}

output "open_fec_gov_ns" {
  value = "${aws_route53_zone.open_fec_gov_zone.name_servers}"
}
