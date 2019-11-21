resource "aws_route53_zone" "sandbox_toplevel" {
  name = "sandbox.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "sandbox_google_txt" {
  zone_id = "${aws_route53_zone.sandbox_toplevel.zone_id}"
  name    = "sandbox.gov."
  type    = "TXT"
  ttl     = 600
  records = ["${local.spf_no_mail}"]
}

# BOD
resource "aws_route53_record" "sandbox_gov__dmarc_sandbox_gov_txt" {
  zone_id = "${aws_route53_zone.sandbox_toplevel.zone_id}"
  name    = "_dmarc.sandbox.gov."
  type    = "TXT"
  ttl     = 300
  records = ["${local.dmarc_reject}"]
}


output "sandbox_ns" {
  value = "${aws_route53_zone.sandbox_toplevel.name_servers}"
}
