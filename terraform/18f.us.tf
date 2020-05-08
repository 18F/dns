resource "aws_route53_zone" "18f_us_zone" {
  name = "18f.us."
  tags {
    Project = "dns"
  }
}

output "18f_us_ns" {
  value = "${aws_route53_zone.18f_us_zone.name_servers}"
}
