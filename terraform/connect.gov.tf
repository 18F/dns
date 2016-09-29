resource "aws_route53_zone" "connect_gov_zone" {
  name = "connect.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_s3_bucket" "connect_gov_redirect" {
    bucket = "connect-gov"
    acl = "public-read"
    website {
      redirect_all_requests_to = "https://login.gov/"
    }
}

output "connect_gov_ns" {
  value="${aws_route53_zone.connect_gov_zone.name_servers}"
}