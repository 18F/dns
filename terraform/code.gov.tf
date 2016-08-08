variable "env_name" {}

resource "aws_route53_zone" "code_toplevel" {
  name = "code.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "apex" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "code.gov."
  type = "A"

  alias {
    name = "d3qovtf6opsrko.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "www.code.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3qovtf6opsrko.cloudfront.net."]
}

output "code_ns" {
  value="${aws_route53_zone.code_toplevel.name_servers}"
}
