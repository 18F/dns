resource "aws_route53_zone" "everykidinapark_gov_zone" {
  name = "everykidinapark.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "everykidinapark_gov_everykidinapark_gov_a" {
  zone_id = "${aws_route53_zone.everykidinapark_gov_zone.zone_id}"
  name = "everykidinapark.gov."
  type = "A"
  alias {
    name = "dualstack.everykidinapark-349509034.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "everykidinapark_gov_www_everykidinapark_gov_a" {
  zone_id = "${aws_route53_zone.everykidinapark_gov_zone.zone_id}"
  name = "www.everykidinapark.gov."
  type = "A"
  alias {
    name = "dualstack.everykidinapark-349509034.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
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

output "everykidinapark_gov_ns" {
  value="${aws_route53_zone.everykidinapark_gov_zone.name_servers}"
}
