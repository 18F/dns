resource "aws_route53_zone" "discovery_gsa_gov_zone" {
  name = "discovery.gsa.gov."

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "discovery_gsa_gov_discovery_gsa_gov_a" {
  zone_id = "${aws_route53_zone.discovery_gsa_gov_zone.zone_id}"
  name    = "discovery.gsa.gov."
  type    = "A"

  alias {
    name                   = "d11du9vova78yj.cloudfront.net."
    zone_id                = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "discovery_gsa_gov_3507f28574ed43c4bd2a644f46b397c0_discovery_gsa_gov_cname" {
  zone_id = "${aws_route53_zone.discovery_gsa_gov_zone.zone_id}"
  name    = "3507f28574ed43c4bd2a644f46b397c0.discovery.gsa.gov."
  type    = "CNAME"
  ttl     = 300
  records = ["ab0dd8e8680449e324abcfd7f80df50b10b58ac3.comodoca.com."]
}

output "discovery_gsa_gov_ns" {
  value = "${aws_route53_zone.discovery_gsa_gov_zone.name_servers}"
}
