data "aws_route53_zone" "zone" {
  zone_id = "${var.zone_id}"
}

# https://cyber.dhs.gov/bod/18-01/#what-should-be-done-with-domains-that-do-not-send-mail

resource "aws_route53_record" "spf" {
  zone_id = "${var.zone_id}"
  name    = "${data.aws_route53_zone.zone.name}."
  type    = "TXT"
  ttl     = 300
  records = ["${var.spf_records}"]
}

resource "aws_route53_record" "dmarc" {
  zone_id = "${var.zone_id}"
  name    = "_dmarc.${data.aws_route53_zone.zone.name}."
  type    = "TXT"
  ttl     = 300

  # https://cyber.dhs.gov/bod/18-01/#dhs-dmarc-reporting-location
  records = ["v=DMARC1; p=${var.dmarc_policy}; pct=${var.dmarc_pct}; fo=1; ri=86400; rua=${var.dmarc_rua},mailto:reports@dmarc.cyber.dhs.gov; ruf=${var.dmarc_ruf}"]
}
