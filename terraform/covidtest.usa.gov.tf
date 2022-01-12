resource "aws_route53_zone" "covidtest_usa_gov_zone" {
  name = "covidtest.usa.gov."

  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.covidtest_usa_gov_zone.zone_id
  name    = "covidtest.usa.gov."
  type    = "CNAME"
  ttl     = "60"
  records = ["www.usa.gov"]
}

resource "aws_route53_zone" "staging_covidtest_usa_gov_zone" {
  name = "staging-covidtest.usa.gov."

  tags = {
    Project = "dns"
  }
}

resource "aws_route53_record" "staging_covidtest_usa_gov_cname" {
  zone_id = aws_route53_zone.staging_covidtest_usa_gov_zone.zone_id
  name    = "staging-covidtest.usa.gov."
  type    = "CNAME"
  ttl     = "60"
  records = ["www.usa.gov"]
}

output "covidtest_usa_gov_ns" {
  value = aws_route53_zone.covidtest_usa_gov_zone.name_servers
}

output "staging_covidtest_usa_gov_ns" {
  value = aws_route53_zone.staging_covidtest_usa_gov_zone.name_servers
}
