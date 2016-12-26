resource "aws_route53_zone" "connect_gov_zone" {
  name = "connect.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "connect_gov_connect_gov_a" {
  zone_id = "${aws_route53_zone.connect_gov_zone.zone_id}"
  name = "connect.gov"
  type = "A"

  alias {
    name = "d1pxy6t1mlaum7.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "www_connect_gov_connect_gov_cname" {
  zone_id = "${aws_route53_zone.connect_gov_zone.zone_id}"
  name = "www.connect.gov"
  type = "A"
  alias {
    name = "d1pxy6t1mlaum7.cloudfront.net"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = true
  }
}

output "connect_gov_ns" {
  value="${aws_route53_zone.connect_gov_zone.name_servers}"
}

resource "aws_route53_record" "connect_gov_connect_gov_mx" {
  zone_id = "${aws_route53_zone.connect_gov_zone.zone_id}"
  name = "connect.gov."
  type = "MX"
  ttl = 300
  records = ["1 aspmx.l.google.com", "5 alt2.aspmx.l.google.com", "5 alt1.aspmx.l.google.com", "10 alt3.aspmx.l.google.com", "10 alt4.aspmx.l.google.com"]
}

resource "aws_route53_record" "v_connect_gov_txt" {
  zone_id = "${aws_route53_zone.connect_gov_zone.zone_id}"
  name = "connect.gov"
  type = "TXT"
  ttl = 600
  records = ["v=spf1 include:spf_sa.gsa.gov ~all"]
}

resource "aws_route53_record" "google_site_connect_gov_txt" {
  zone_id = "${aws_route53_zone.connect_gov_zone.zone_id}"
  name = "connect.gov"
  type = "TXT"
  ttl = 600
  records = ["google-site-verification=j3qyXzcDt_O3t0sdYy6FCQlYJnV5ASd0GYIhicPPzOg"]
}
