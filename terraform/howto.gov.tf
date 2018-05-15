resource "aws_route53_zone" "howto_gov_zone" {
  name = "howto.gov."
  tags {
    Project = "dns"
  }
}

# howto.gov
resource "aws_route53_record" "howto_gov_apex" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "howto.gov."
  type = "A"
  ttl = "300"
  records = [
    "216.128.241.26",
    "173.252.148.83",
    "2607:F020:4:1911:CAFE:DEC:AF:52",
    "2607:F020:2004:1911:CAFE:DEC:AF:52"
  ]
}

# www.howto.gov
resource "aws_route53_record" "howto_gov_www" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "www.howto.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "www.howto.gov.edgekey.net."
  ]
}

# usasearch.howto.gov
resource "aws_route53_record" "usasearch_howto_gov" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "usasearch.howto.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "usasearch.github.com."
  ]
}

# usasearchsupport.howto.gov
resource "aws_route53_record" "usasearchsupport_howto_gov" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "usasearchsupport.howto.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "searchusa.zendesk.com."
  ]
}



# ==========
# TXT Records

# _dmarc.howto.gov - TXT
resource "aws_route53_record" "dmarc_howto_gov_txt" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "_dmarc.howto.gov."
  type = "TXT"
  ttl = "300"
  records = [
    "v=DMARC1; p=none; rua=mailto:dmarcreports@gsa.gov; sp=none; ri=86400"
  ]
}


# mail.usasearch.howto.gov - TXT
resource "aws_route53_record" "mail_usasearch_howto_gov_txt" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "mail.usasearch.howto.gov."
  type = "TXT"
  ttl = "3600"
  records = [
    "v=spf1 include:_spf.zdsys.com include:emailsrvr.com include:support.zendesk.com include:443363-staging.gsa.gov include:443365-cron.gsa.gov include:443366-web.gsa.gov ~all"
  ]
}


# ==========
# MX Records


# mail.usasearch.howto.gov — MX
resource "aws_route53_record" "mail_usasearch_howto_gov_mx" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "mail.usasearch.howto.gov."
  type = "MX"
  ttl = "3600"
  records = [
    "10 mx1.emailsrvr.com.",
    "20 mx2.emailsrvr.com."
  ]
}


# mail.usasearch.howto.gov — A
resource "aws_route53_record" "mail_usasearch_howto_gov_a" {
  zone_id = "${aws_route53_zone.howto_gov_zone.zone_id}"
  name = "mail.usasearch.howto.gov."
  type = "A"
  ttl = "300"
  records = [
    "173.203.40.168"
  ]
}

output "howto_gov_ns" {
  value="${aws_route53_zone.howto_gov_zone.name_servers}"
}
