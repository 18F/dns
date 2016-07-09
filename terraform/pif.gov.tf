provider "aws" {
    region = "us-east-1"
}

variable "env_name" {}

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
    name = "s3-website-us-east-1.amazonaws.com."
    zone_id = "Z3AQBSTGFYJSTF"
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

output "pif_ns" {
    value="${aws_route53_zone.pif_toplevel.name_servers}"
}
