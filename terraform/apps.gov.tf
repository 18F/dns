resource "aws_route53_zone" "apps_gov_zone" {
  name = "apps.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "apps_gov_apps_gov_a" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "apps.gov."
  type = "A"
  alias {
    name = "d37tzfgd0a69in.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "apps_gov_apps_gov_mx" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "apps.gov."
  type = "MX"
  ttl = 60
  records = ["10 inbound-smtp.us-east-1.amazonaws.com."]
}

resource "aws_route53_record" "apps_gov_apps_gov_txt" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "apps.gov."
  type = "TXT"
  ttl = 60
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "apps_gov_7020370b93980d607416a29297f68e3b_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "7020370b93980d607416a29297f68e3b.apps.gov."
  type = "CNAME"
  ttl = 60
  records = ["df309d7dd3fde8755d6d9da8bf2911dcc59f0eb8.comodoca.com."]
}

resource "aws_route53_record" "apps_gov__amazonses_apps_gov_txt" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "_amazonses.apps.gov."
  type = "TXT"
  ttl = 60
  records = ["9s5WB+tcaXC6+ygBRGy9ScjCLmNOme1BKW7s3y2+Y0s="]
}

resource "aws_route53_record" "apps_gov_f6vzy6nhqi3u6rk4yxxawrihkqtvx5by__domainkey_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "f6vzy6nhqi3u6rk4yxxawrihkqtvx5by._domainkey.apps.gov."
  type = "CNAME"
  ttl = 60
  records = ["f6vzy6nhqi3u6rk4yxxawrihkqtvx5by.dkim.amazonses.com."]
}

resource "aws_route53_record" "apps_gov_mandrill__domainkey_apps_gov_txt" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "mandrill._domainkey.apps.gov."
  type = "TXT"
  ttl = 60
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "apps_gov_nmhy3ybmnflrc262ad44iiydvn2iptrw__domainkey_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "nmhy3ybmnflrc262ad44iiydvn2iptrw._domainkey.apps.gov."
  type = "CNAME"
  ttl = 60
  records = ["nmhy3ybmnflrc262ad44iiydvn2iptrw.dkim.amazonses.com."]
}

resource "aws_route53_record" "apps_gov_tsucoqfortrlk2ht7wowgq642vrg4hjl__domainkey_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "tsucoqfortrlk2ht7wowgq642vrg4hjl._domainkey.apps.gov."
  type = "CNAME"
  ttl = 60
  records = ["tsucoqfortrlk2ht7wowgq642vrg4hjl.dkim.amazonses.com."]
}

resource "aws_route53_record" "apps_gov_autodiscover_apps_gov_cname" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "autodiscover.apps.gov."
  type = "CNAME"
  ttl = 60
  records = ["autodiscover.mail.us-east-1.awsapps.com."]
}

resource "aws_route53_record" "apps_gov_www_apps_gov_a" {
  zone_id = "${aws_route53_zone.apps_gov_zone.zone_id}"
  name = "www.apps.gov."
  type = "A"
  alias {
    name = "d37tzfgd0a69in.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "apps_gov_ns" {
  value="${aws_route53_zone.apps_gov_zone.name_servers}"
}