resource "aws_route53_zone" "pif_toplevel" {
   name = "pif.gov"

   tags {
     Project = "dns"
   }
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "pif.gov."
  type = "A"

  alias {
    name = "dgevgiwb7xxpw.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "mx" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "pif.gov."
  type = "MX"
  ttl = 60
  records = ["10 alt3.aspmx.l.google.com.", "10 alt4.aspmx.l.google.com.", "1 aspmx.l.google.com.", "5 alt1.aspmx.l.google.com.", "5 alt2.aspmx.l.google.com."]
}

resource "aws_route53_record" "txt" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "pif.gov."
  type = "TXT"
  ttl = 60
  records = ["v=spf1 include:gsa.gov ~all"]
}

resource "aws_route53_record" "asterisk_cname" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "*.pif.gov."
  type = "CNAME"
  ttl = 300
  records = ["cloud-gov-pif-ELB-9ZR5WLEVW83I-466945119.us-east-1.elb.amazonaws.com"]
}

resource "aws_route53_record" "amazonses_txt" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "_amazonses.pif.gov."
  type = "TXT"
  ttl = 60
  records = ["vfTT1hoRSwsfsjE7oHkyOB2+OHk+t2NF3S3l5hL4NA8="]
}

resource "aws_route53_record" "ses_cname_1" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "hqxmpb4wvicc7sgousvwutczjusp4sfc._domainkey.pif.gov."
  type = "CNAME"
  ttl = 1800
  records = ["hqxmpb4wvicc7sgousvwutczjusp4sfc.dkim.amazonses.com"]
}

resource "aws_route53_record" "ses_cname_2" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "nv3r33tblbqana3lj5a5x4bzq4gxcetz._domainkey.pif.gov."
  type = "CNAME"
  ttl = 1800
  records = ["nv3r33tblbqana3lj5a5x4bzq4gxcetz.dkim.amazonses.com"]
}

resource "aws_route53_record" "ses_cname_3" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "zozbm3olsvjtarcghhuz2sneknw7ar5t._domainkey.pif.gov."
  type = "CNAME"
  ttl = 1800
  records = ["zozbm3olsvjtarcghhuz2sneknw7ar5t.dkim.amazonses.com"]
}

resource "aws_route53_record" "apply_cname" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "apply.pif.gov."
  type = "CNAME"
  ttl = 60
  records = ["apply.pif.gov.00d30000000jvliea4.live.siteforce.com"]
}

resource "aws_route53_record" "proposal_cname" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "proposal.pif.gov."
  type = "CNAME"
  ttl = 60
  records = ["proposal.pif.gov.00du0000000leuxmac.live.siteforce.com"]
}

resource "aws_route53_record" "beta" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "beta.pif.gov."
  type = "CNAME"
  ttl = 60
  records = ["presidential-innovation-fellows.github.io"]
}

resource "aws_route53_record" "recalls_cname" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "recalls.pif.gov."
  type = "CNAME"
  ttl = 300
  records = ["presidential-innovation-fellows.github.io"]
}

resource "aws_route53_record" "fellows_in_innovation_pif_cname" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "fellows-in-innovation.pif.gov."
  type = "CNAME"
  ttl = 300
  records = ["d3at1jdwnpqw7w.cloudfront.net"]
}

resource "aws_route53_record" "paygap_pif_cname" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "paygap.pif.gov."
  type = "CNAME"
  ttl = 300
  records = ["d2qm19v1sj7zt0.cloudfront.net"]
}

resource "aws_route53_record" "review_cname" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "review.pif.gov."
  type = "CNAME"
  ttl = 60
  records = ["review.pif.gov.00d30000000jvliea4.live.siteforce.com"]
}

resource "aws_route53_record" "www-main" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "www.pif.gov."
  type = "A"

  alias {
    name = "dgevgiwb7xxpw.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "pif_ns" {
    value="${aws_route53_zone.pif_toplevel.name_servers}"
}
