# FEC DNS is set up as follows:
# Savvis/CenturyLink still controls and hosts the bulk of DNS under fec.gov
# they are delegating two names to us:
#
# transition.fec.gov
# www.fec.gov
# 
# and because you can't CNAME the root domain, Savvis/CenturyLink are 
# pointing the root at an FEC server that HTTP redirects to www.fec.gov

resource "aws_route53_zone" "www_fec_gov_zone" {
  name = "www.fec.gov"
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "www_fec_gov_a_alias" {
  zone_id = "${aws_route53_zone.www_fec_gov_zone.zone_id}"
  name = "www.fec.gov"
  type = "A"
  alias {
    name = "d3t5a36r5g3qx4.cloudfront.net"
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

output "www_fec_gov_ns" {
  value="${aws_route53_zone.www_fec_gov_zone.name_servers}"
}
