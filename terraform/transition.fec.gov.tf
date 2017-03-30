resource "aws_route53_zone" "fec_transiton_us_zone" {
  name = "transition.fec.gov"
  tags {
    Project = "dns"
  }
}

output "fec_transiton_us_ns" {
  value="${aws_route53_zone.18f_us_zone.name_servers}"
}
