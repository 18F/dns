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
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "mx" {
  zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
  name = "pif.gov."
  type = "MX"
  ttl = 60
  records = ["10 alt3.aspmx.l.google.com.", "10 alt4.aspmx.l.google.com.", "1 aspmx.l.google.com.", "5 alt1.aspmx.l.google.com.", "5 alt2.aspmx.l.google.com."]
}

output "pif_ns" {
    value="${aws_route53_zone.pif_toplevel.name_servers}"
}
