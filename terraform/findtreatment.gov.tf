resource "aws_route53_zone" "findtreatment_toplevel" {
  name = "findtreatment.gov"

  tags {
    Project = "dns"
  }
}

# BOD
resource "aws_route53_record" "findtreatment_gov__dmarc_findtreatment_gov_txt" {
  zone_id = "${aws_route53_zone.findtreatment_toplevel.zone_id}"
  name = "_dmarc.findtreatment.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_reject}"]
}


output "findtreatment_ns" {
  value="${aws_route53_zone.findtreatment_toplevel.name_servers}"
}
