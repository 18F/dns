resource "aws_route53_zone" "digitalgov_gov_toplevel" {
  name = "digitalgov.gov."
  tags {
    Project = "dns"
  }
}

# digitalgov.gov
resource "aws_route53_record" "digitalgov_gov_apex" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "digitalgov.gov."
  type = "A"

  alias {
    name = "djce1rrjucuix.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# o166.email.digitalgov.gov — A
resource "aws_route53_record" "o166_email_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "o166.email.digitalgov.gov."
  type = "A"

  alias {
    name = "167.89.86.190"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# admin.digitalgov.gov — A
resource "aws_route53_record" "admin_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "admin.digitalgov.gov."
  type = "A"

  alias {
    name = "173.203.40.168"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# email.digitalgov.gov — A
resource "aws_route53_record" "email_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "admin.digitalgov.gov."
  type = "A"

  alias {
    name = "216.128.241.47, 173.252.148.104"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# www.digitalgov.gov
resource "aws_route53_record" "digitalgov_gov_www" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "www.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "djce1rrjucuix.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# demo.digitalgov.gov
resource "aws_route53_record" "demo_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "demo.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "d3oyi0vhjafspr.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# usdigitalregistry.digitalgov.gov
resource "aws_route53_record" "usdigitalregistry_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "usdigitalregistry.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "gsa-elb-ecs-prod-wild-diggov-1-1458076956.us-east-1.elb.amazonaws.com."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# dap.digitalgov.gov
resource "aws_route53_record" "dap_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "dap.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "www.usa.gov.edgekey.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# search.digitalgov.gov
resource "aws_route53_record" "search_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "search.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "dgsearchsite.infr.search.usa.gov."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# summit.digitalgov.gov
resource "aws_route53_record" "summit_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "summit.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "www.usa.gov.edgekey.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# connect.digitalgov.gov
resource "aws_route53_record" "connect_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "connect.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "1962994g44.secure0082.hubspot.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# find.digitalgov.gov
resource "aws_route53_record" "find_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "find.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "digitalgov.sites.infr.search.usa.gov."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# stage-socialmobileregistry.digitalgov.gov
resource "aws_route53_record" "stage-socialmobileregistry_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "gsa-elb-ecs-stg-wild-diggov-1-1092638291.us-east-1.elb.amazonaws.com."
  type = "CNAME"

  alias {
    name = "gsa-elb-ecs-stg-wild-diggov-1-1092638291.us-east-1.elb.amazonaws.com."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# k1._domainkey.support.digitalgov.gov — CNAME
resource "aws_route53_record" "k1_domainkey_support_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "k1._domainkey.support.digitalgov.gov."
  type = "CNAME"

  alias {
    name = "dkim.mcsv.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}



# ==========
# NS Records

# openopps.digitalgov.gov - NS
resource "aws_route53_record" "digitalgov_gov_openopps_25_digitalgov_gov_ns" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "NS"
  alias {
    name = "ns-1231.awsdns-25.org."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# openopps.digitalgov.gov - NS
resource "aws_route53_record" "digitalgov_gov_openopps_56_digitalgov_gov_ns" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "NS"
  alias {
    name = "ns-452.awsdns-56.com."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# openopps.digitalgov.gov - NS
resource "aws_route53_record" "digitalgov_gov_openopps_34_digitalgov_gov_ns" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "NS"
  alias {
    name = "ns-788.awsdns-34.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

# openopps.digitalgov.gov - NS
resource "aws_route53_record" "digitalgov_gov_openopps_43_digitalgov_gov_ns" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "NS"
  alias {
    name = "ns-1886.awsdns-43.co.uk."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}


# ==========
# SPF Records

# support.digitalgov.gov - SPF
resource "aws_route53_record" "digitalgov_gov_support_digitalgov_gov_spf" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "support.digitalgov.gov."
  type = "SPF"
  alias {
    name = "v=spf1 include:spf.mandrillapp.com include:mail.zendesk.com include:emailsrvr.com include:servers.mcsv.net ~all"
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}



# ==========
# TXT Records


# dzc.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_dzc_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "dzc.digitalgov.gov."
  type = "TXT"
  records = [
    "8wtx7v9M"
  ]
}

# email.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_email_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "email.digitalgov.gov."
  type = "TXT"
  ttl = "3600"
  records = [
    "v=spf1 ip4:167.89.86.190 -all"
  ]
}

# m1._domainkey.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_m1_domainkey_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "m1._domainkey.digitalgov.gov."
  type = "TXT"
  records = [
    "k=rsa; t=s; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC4CvMOSVFOQDIJ+HkjdfAmKuBkkiqTwV982PCFBocVGHY07N2uvkleqT+XrySENYYzFrdnk2U1I7HUYkA0tpEZNzU7G67l7u1qWcd5QMBzVDsAg2vJf4fAkAWmdQCyWboeVXCoMnswz5LZK/t0+Z37smv9k2nDK3XNdsYTVu8D8wIDAQAB"
  ]
}

# mandrill._domainkey.support.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_mandrill_domainkey_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "mandrill._domainkey.support.digitalgov.gov."
  type = "TXT"
  ttl = "3600"
  records = [
    "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"
  ]
}

# support.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_support_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "support.digitalgov.gov."
  type = "TXT"
  ttl = "3600"
  records = [
    "v=spf1 include:spf.mandrillapp.com include:mail.zendesk.com include:emailsrvr.com include:servers.mcsv.net ~all"
  ]
}




# ==========
# MX Records


# email.digitalgov.gov — MX
resource "aws_route53_record" "email_digitalgov_gov_mx" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "email.digitalgov.gov."
  type = "MX"
  ttl = "3600"
  records = [
    "10 mx.sendgrid.net."
  ]
}

# support.digitalgov.gov — MX
resource "aws_route53_record" "support_digitalgov_gov_mx" {
  zone_id = "${aws_route53_zone.digitalgov_gov_toplevel.zone_id}"
  name = "support.digitalgov.gov."
  type = "MX"
  ttl = "600"
  records = [
    "10 mx1.emailsrvr.com."
  ]
}

output "digitalgov_gov_ns" {
  value="${aws_route53_zone.digitalgov_gov_toplevel.name_servers}"
}
