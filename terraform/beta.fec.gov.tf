resource "aws_route53_zone" "beta_fec_gov_zone" {
  name = "beta.fec.gov."

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "beta_fec_gov_beta_fec_gov_a" {
  zone_id = "${aws_route53_zone.beta_fec_gov_zone.zone_id}"
  name    = "beta.fec.gov."
  type    = "A"

  alias {
    name                   = "d7y65vr5rtlbx.cloudfront.net."
    zone_id                = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "beta_fec_gov_5edf13670d987dde0f08b24e124a5f6c_beta_fec_gov_cname" {
  zone_id = "${aws_route53_zone.beta_fec_gov_zone.zone_id}"
  name    = "5edf13670d987dde0f08b24e124a5f6c.beta.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["7f380b13d31d7eccf547241c9016398f0d72c7bd.comodoca.com."]
}

resource "aws_route53_record" "beta_fec_gov_d2cbe6c79f0a8b0e52444d0c68b8f814_beta_fec_gov_cname" {
  zone_id = "${aws_route53_zone.beta_fec_gov_zone.zone_id}"
  name    = "d2cbe6c79f0a8b0e52444d0c68b8f814.beta.fec.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["e81983cf1be0d76fb75709f6edff78532e85ca0c.comodoca.com."]
}

output "beta_fec_gov_ns" {
  value = "${aws_route53_zone.beta_fec_gov_zone.name_servers}"
}
