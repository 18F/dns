resource "aws_route53_zone" "digitalgov_gov_zone" {
  name = "digitalgov.gov."
  tags {
    Project = "dns"
  }
}

# digitalgov.gov
# redirects to digital.gov via Federalist Redirect
# See: https://github.com/18F/pages-redirects
resource "aws_route53_record" "digitalgov_gov_apex" {
 zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
 name = "digitalgov.gov."
 type = "A"

 alias {
   name = "d1wh5biaq5z7yu.cloudfront.net."
   zone_id = "${local.cloud_gov_cloudfront_zone_id}"
   evaluate_target_health = false
 }
}

# www.digitalgov.gov
# redirects to digital.gov via Federalist Redirect
# See: https://github.com/18F/pages-redirects
resource "aws_route53_record" "digitalgov_gov_www" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "www.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "d1wh5biaq5z7yu.cloudfront.net."
  ]
}

# demo.digitalgov.gov
# redirects to demo.digital.gov via Federalist Redirect
# See: https://github.com/18F/pages-redirects
resource "aws_route53_record" "demo_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "demo.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "d1wh5biaq5z7yu.cloudfront.net."
  ]
}

# o166.email.digitalgov.gov — A
resource "aws_route53_record" "o166_email_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "o166.email.digitalgov.gov."
  type = "A"
  ttl = "300"
  records = [
    "167.89.86.190"
  ]
}

# admin.digitalgov.gov — A
resource "aws_route53_record" "admin_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "admin.digitalgov.gov."
  type = "A"
  ttl = "600"
  records = [
    "173.203.40.168"
  ]
}

# support.digitalgov.gov — A
resource "aws_route53_record" "support_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "support.digitalgov.gov."
  type = "A"
  ttl = "600"
  records = [
    "216.128.241.47",
    "173.252.148.104",
  ]
}

# ===== Temporary record for validation =====
resource "aws_route53_record" "dap_validation_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "_c80f04313e7e2fadb177e34e2dedf0d6.dap.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "_3f7fd3397174324e46798283045cd3e7.acm-validations.aws"
  ]
}
# ===== End temporary record for validation =====

# required for AWS SES to DKIM-sign emails sent "From" support.digitalgov.gov
resource "aws_route53_record" "support_digitalgov_gov_ses_dkim_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "4ixtpnvpubjuxqvnex727otq55y2ew7w._domainkey.support.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "4ixtpnvpubjuxqvnex727otq55y2ew7w.dkim.amazonses.com"
  ]
}

# required for AWS SES to DKIM-sign emails sent "From" support.digitalgov.gov
resource "aws_route53_record" "support_digitalgov_gov_ses_dkim_b" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "tmoxp5vgftwsmhkukt2z6ayvfj5bw7zo._domainkey.support.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "tmoxp5vgftwsmhkukt2z6ayvfj5bw7zo.dkim.amazonses.com"
  ]
}

# required for AWS SES to DKIM-sign emails sent "From" support.digitalgov.gov
resource "aws_route53_record" "support_digitalgov_gov_ses_dkim_c" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "5uiojtkg7z5grkldq7ajm3zamtzh3h2s._domainkey.support.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "5uiojtkg7z5grkldq7ajm3zamtzh3h2s.dkim.amazonses.com"
  ]
}





# OpenOpps ------------------------------------------

resource "aws_route53_record" "digitalgov_gov_openopps_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "A"
  alias {
    name = "d11og6pgwhrztr.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "digitalgov_gov_openopps_digitalgov_gov_mx" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "MX"
  ttl = 300
  records = ["${local.mandrill_mx}"]
}

resource "aws_route53_record" "digitalgov_gov_openopps_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "openopps.digitalgov.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.mandrill_spf}"]
}

resource "aws_route53_record" "digitalgov_gov_mandrill__domainkey_openopps_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "mandrill._domainkey.openopps.digitalgov.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.mandrill_dkim}"]
}




# usdigitalregistry -------------------------------------

# usdigitalregistry.digitalgov.gov
resource "aws_route53_record" "usdigitalregistry_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "usdigitalregistry.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "alb-scmdrg-prod-digitalgov-pub-1-1069371853.us-east-1.elb.amazonaws.com."
  ]
}

# stage-socialmobileregistry.digitalgov.gov
resource "aws_route53_record" "stage-socialmobileregistry_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "stage-socialmobileregistry.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "alb-scmdrg-stg-digitalgov-pub-1-286604225.us-east-1.elb.amazonaws.com."
  ]
}


# DAP -------------------------------------

# dap.digitalgov.gov
resource "aws_route53_record" "dap_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "dap.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "d27f3qgc9anoq2.cloudfront.net."
  ]
}



# search.digitalgov.gov
resource "aws_route53_record" "search_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "search.digitalgov.gov."
  type = "CNAME"
  ttl = "600"
  records = [
    "dgsearchsite.infr.search.usa.gov."
  ]
}

# summit.digitalgov.gov
resource "aws_route53_record" "summit_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "summit.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "d1wh5biaq5z7yu.cloudfront.net."
  ]
}

# connect.digitalgov.gov
resource "aws_route53_record" "connect_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "connect.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "1962994g44.secure0082.hubspot.net."
  ]
}

# find.digitalgov.gov
resource "aws_route53_record" "find_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "find.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "digitalgov.sites.infr.search.usa.gov."
  ]
}

# this record can be removed after 2018-03-31 once the search-gov app is no longer sending emails via Mandrill
# k1._domainkey.support.digitalgov.gov — CNAME
resource "aws_route53_record" "k1_domainkey_support_digitalgov_gov_a" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "k1._domainkey.support.digitalgov.gov."
  type = "CNAME"
  ttl = "300"
  records = [
    "dkim.mcsv.net."
  ]
}


# ==========
# TXT Records

# dzc.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_dzc_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "dzc.digitalgov.gov."
  type = "TXT"
  ttl = "300"
  records = [
    "8wtx7v9M"
  ]
}

# email.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_email_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "email.digitalgov.gov."
  type = "TXT"
  ttl = "3600"
  records = [
    "v=spf1 ip4:167.89.86.190 -all"
  ]
}

# m1._domainkey.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_m1_domainkey_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "m1._domainkey.digitalgov.gov."
  type = "TXT"
  ttl = "300"
  records = [
    "k=rsa; t=s; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC4CvMOSVFOQDIJ+HkjdfAmKuBkkiqTwV982PCFBocVGHY07N2uvkleqT+XrySENYYzFrdnk2U1I7HUYkA0tpEZNzU7G67l7u1qWcd5QMBzVDsAg2vJf4fAkAWmdQCyWboeVXCoMnswz5LZK/t0+Z37smv9k2nDK3XNdsYTVu8D8wIDAQAB"
  ]
}

# this record can be removed after 2018-03-31 once the search-gov app is no longer sending emails via Mandrill
# mandrill._domainkey.support.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_mandrill_domainkey_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "mandrill._domainkey.support.digitalgov.gov."
  type = "TXT"
  ttl = "3600"
  records = ["${local.mandrill_dkim}"]
}

# the Mandrill-related values in this record can be removed after 2018-03-31 once the search-gov app is no longer sending emails via Mandrill
# support.digitalgov.gov - TXT
resource "aws_route53_record" "digitalgov_gov_support_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "support.digitalgov.gov."
  type = "TXT"
  ttl = "3600"
  records = [
    "v=spf1 include:spf.mandrillapp.com include:mail.zendesk.com include:emailsrvr.com include:servers.mcsv.net include:amazonses.com ~all"
  ]
}


# required by AWS SES to verify control of the support.digitalgov.gov domain
resource "aws_route53_record" "support_digitalgov_gov_ses_verification" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "_amazonses.support.digitalgov.gov."
  type = "TXT"
  ttl = "3600"
  records = [
    "T5etn/YylzSUQQWw6HspyK4+2+B9XzE7Kajpz9ogfJI="
  ]
}



# ==========
# MX Records


# email.digitalgov.gov — MX
resource "aws_route53_record" "email_digitalgov_gov_mx" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "email.digitalgov.gov."
  type = "MX"
  ttl = "3600"
  records = [
    "10 mx.sendgrid.net."
  ]
}

# support.digitalgov.gov — MX
resource "aws_route53_record" "support_digitalgov_gov_mx" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "support.digitalgov.gov."
  type = "MX"
  ttl = "600"
  records = [
    "10 mx1.emailsrvr.com."
  ]
}


# BOD
resource "aws_route53_record" "digitalgov_gov_dmarc_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "digitalgov.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.spf_no_mail}"]
}

resource "aws_route53_record" "digitalgov_gov__dmarc_digitalgov_gov_txt" {
  zone_id = "${aws_route53_zone.digitalgov_gov_zone.zone_id}"
  name = "_dmarc.digitalgov.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_100}"]
}


output "digitalgov_gov_ns" {
  value="${aws_route53_zone.digitalgov_gov_zone.name_servers}"
}
