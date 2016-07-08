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

resource "aws_route53_record" "pif_toplevel_ns" {
    zone_id = "${aws_route53_zone.pif_toplevel.zone_id}"
    name = "pif.gov"
    type = "NS"
    ttl = "60"
    records = [
        "ns-632.awsdns-15.net.",
        "ns-409.awsdns-51.com.",
        "ns-1700.awsdns-20.co.uk.",
        "ns-1361.awsdns-42.org."
    ]
}