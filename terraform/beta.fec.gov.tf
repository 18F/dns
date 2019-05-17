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
