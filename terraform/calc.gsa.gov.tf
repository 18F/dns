resource "aws_route53_zone" "calc_gsa_gov_zone" {
  name = "calc.gsa.gov."

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "calc_gsa_gov_calc_gsa_gov_a" {
  zone_id = "${aws_route53_zone.calc_gsa_gov_zone.zone_id}"
  name    = "calc.gsa.gov."
  type    = "A"

  alias {
    name                   = "d3ulj13shqrbkv.cloudfront.net."
    zone_id                = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "calc_gsa_gov_53401af9bf961a52bf77413b1b769e3d_calc_gsa_gov_cname" {
  zone_id = "${aws_route53_zone.calc_gsa_gov_zone.zone_id}"
  name    = "53401af9bf961a52bf77413b1b769e3d.calc.gsa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["d7acc64bebd6a4abd60bbd5c3711a3e2d90c14f8.comodoca.com."]
}

resource "aws_route53_record" "calc_gsa_gov_ea1c6bc2bcfeca68fa3da9697e2b980d_calc_gsa_gov_cname" {
  zone_id = "${aws_route53_zone.calc_gsa_gov_zone.zone_id}"
  name    = "ea1c6bc2bcfeca68fa3da9697e2b980d.calc.gsa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["88e8ce2c97c3ea10aa4ee2c7d26442a6141d7e53.comodoca.com."]
}

resource "aws_route53_record" "calc_gsa_gov_calc_gsa_gov_txt" {
  zone_id = "${aws_route53_zone.calc_gsa_gov_zone.zone_id}"
  name = "calc.gsa.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:amazonses.com ~all"]
}

output "calc_gsa_gov_ns" {
  value = "${aws_route53_zone.calc_gsa_gov_zone.name_servers}"
}
