resource "aws_route53_zone" "cld_epa_gov_zone" {
  name = "cld.epa.gov."

  tags = {
    Project = "dns"
  }
}

output "cld_epa_gov_ns" {
  value = aws_route53_zone.cld_epa_gov_zone.name_servers
}
