data "aws_route53_zone" "zone" {
  zone_id = var.zone_id
}

locals {
  # https://cyber.dhs.gov/bod/18-01/#dhs-dmarc-reporting-location
  dhs_dmarc_reporting_location = "mailto:reports@dmarc.cyber.dhs.gov"
}

resource "aws_route53_record" "txt" {
  zone_id = var.zone_id
  name    = data.aws_route53_zone.zone.name
  type    = "TXT"
  ttl     = 300
  records = var.txt_records
}

resource "aws_route53_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc.${data.aws_route53_zone.zone.name}"
  type    = "TXT"
  ttl     = 300

  records = ["v=DMARC1; p=${var.dmarc_policy}; pct=${var.dmarc_pct}; fo=1; ri=86400; rua=${var.dmarc_rua},${local.dhs_dmarc_reporting_location}; ruf=${var.dmarc_ruf}"]
}
