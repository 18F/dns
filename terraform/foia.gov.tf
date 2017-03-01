resource "aws_route53_zone" "foia_gov_zone" {
  name = "foia.gov."
  tags {
    Project = "dns"
  }
}

output "foia_gov_ns" {
  value="${aws_route53_zone.foia_gov_zone.name_servers}"
}
