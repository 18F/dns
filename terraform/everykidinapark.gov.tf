resource "aws_route53_zone" "everykidinapark_gov_zone" {
  name = "everykidinapark.gov."
  tags {
    Project = "dns"
  }
}

# Configured with CDN Broker
resource "aws_route53_record" "everykidinapark_gov_everykidinapark_gov_a" {
  zone_id = "${aws_route53_zone.everykidinapark_gov_zone.zone_id}"
  name = "everykidinapark.gov."
  type = "A"
  alias {
    name = "d356so74a5xncl.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# Configured with CDN Broker
resource "aws_route53_record" "everykidinapark_gov_www_everykidinapark_gov_a" {
  zone_id = "${aws_route53_zone.everykidinapark_gov_zone.zone_id}"
  name = "www.everykidinapark.gov."
  type = "A"
  alias {
    name = "d356so74a5xncl.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "everykidinapark_gov_faf32864d6063003a2c9b208e74ab021_www_everykidinapark_gov_cname" {
  zone_id = "${aws_route53_zone.everykidinapark_gov_zone.zone_id}"
  name = "faf32864d6063003a2c9b208e74ab021.www.everykidinapark.gov."
  type = "CNAME"
  ttl = 5
  records = ["152983f9fda5218669323f1d3859987b0a652251.comodoca.com."]
}

resource "aws_route53_record" "everykidinapark_gov_398a1a6f10083c7a093fc5988ea1977b_www_everykidinapark_gov_cname" {
  zone_id = "${aws_route53_zone.everykidinapark_gov_zone.zone_id}"
  name = "398a1a6f10083c7a093fc5988ea1977b.www.everykidinapark.gov."
  type = "CNAME"
  ttl = 5
  records = ["9bbc15d353b32d96be120d1cb2af1b89e0763167.comodoca.com."]
}

resource "aws_route53_record" "everykidinapark_gov_everykidinapark_gov_txt" {
  zone_id = "${aws_route53_zone.everykidinapark_gov_zone.zone_id}"
  name = "everykidinapark.gov."
  type = "TXT"
  ttl = 300
  records = [
     "v=spf1 -all",
     "v=DMARC1; p=reject; rua=dmarcreports@gsa.gov; ruf=dmarcfailures@gsa.gov; fo=1; ri=86400"
  ]
}

output "everykidinapark_gov_ns" {
  value="${aws_route53_zone.everykidinapark_gov_zone.name_servers}"
}
