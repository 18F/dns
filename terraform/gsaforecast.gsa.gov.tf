resource "aws_route53_zone" "gsaforecast_gsa_gov_zone" {
  name = "gsaforecast.gsa.gov."

  tags = {
    Project = "dns"
  }
}

output "gsaforecast_gsa_gov_ns" {
  value = aws_route53_zone.gsaforecast_gsa_gov_zone.name_servers
}
