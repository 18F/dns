resource "aws_route53_zone" "18f_gov_zone" {
  name = "18f.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "18f_gov_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "18f.gov."
  type = "A"
  alias {
    name = "d1undivnru8ry9.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "18f.gov."
  type = "MX"
  ttl = 300
  records = ["10 30288227.in1.mandrillapp.com", "20 30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "18f_gov_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "18f_gov_01326251e4e9fc611488dd6bceaeba90_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "01326251e4e9fc611488dd6bceaeba90.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["bf0db5e895e580832a39b4e0eff83874dc595c73.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_4977f4aa788de0a5daa860d9fc0215a5_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "4977f4aa788de0a5daa860d9fc0215a5.18f.gov."
  type = "CNAME"
  ttl = 5
  records = ["7573d58626148c30b5d2fbf1dd7bf7a302f23e4e.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_89afa0142502f9be9fba3afd80a703e1_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "89afa0142502f9be9fba3afd80a703e1.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["11c866ad428c34fc9aa545123e72ef879b0898ef.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_star_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "*.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-elb-elb-155eqjkdtn55i-611685241.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov__amazonses_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "_amazonses.18f.gov."
  type = "TXT"
  ttl = 1800
  records = ["eLlEp8JypEb+vZk7qRQsdhwf2t1qVLKg9TNbCsdbpVQ="]
}

resource "aws_route53_record" "18f_gov_ad4lynrrv5foixysvwm47qbeuj5bbbyr__domainkey_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "ad4lynrrv5foixysvwm47qbeuj5bbbyr._domainkey.18f.gov."
  type = "CNAME"
  ttl = 1800
  records = ["ad4lynrrv5foixysvwm47qbeuj5bbbyr.dkim.amazonses.com"]
}

resource "aws_route53_record" "18f_gov_jfumetkqthwzknxvlqsi7cnwzxultyek__domainkey_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "jfumetkqthwzknxvlqsi7cnwzxultyek._domainkey.18f.gov."
  type = "CNAME"
  ttl = 1800
  records = ["jfumetkqthwzknxvlqsi7cnwzxultyek.dkim.amazonses.com"]
}

resource "aws_route53_record" "18f_gov_mandrill__domainkey_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "mandrill._domainkey.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "18f_gov_qegrzvzekq4wiompgqufe4xwmarm37lh__domainkey_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "qegrzvzekq4wiompgqufe4xwmarm37lh._domainkey.18f.gov."
  type = "CNAME"
  ttl = 1800
  records = ["qegrzvzekq4wiompgqufe4xwmarm37lh.dkim.amazonses.com"]
}

resource "aws_route53_record" "18f_gov_api_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "api.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["18f.domains.api.data.gov"]
}

resource "aws_route53_record" "18f_gov_atf-eregs_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "atf-eregs.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dualstack.production-star-18f-gov-elb-1963420885.us-gov-west-1.elb.amazonaws.com"]
}

resource "aws_route53_record" "18f_gov_c2_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "c2.18f.gov."
  type = "MX"
  ttl = 60
  records = ["10 30288227.in1.mandrillapp.com", "20 30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "18f_gov_c2_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "c2.18f.gov."
  type = "TXT"
  ttl = 60
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "18f_gov_mandrill__domainkey_c2_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "mandrill._domainkey.c2.18f.gov."
  type = "TXT"
  ttl = 60
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "18f_gov_c6769c03c29466618a6bd23b158d28a6_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "c6769c03c29466618a6bd23b158d28a6.18f.gov."
  type = "CNAME"
  ttl = 5
  records = ["25dcca43a0e035f9109366532ca4bea5a552e1ba.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_cap_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "cap.18f.gov."
  type = "A"
  alias {
    name = "dualstack.production-star-18f-gov-elb-1963420885.us-gov-west-1.elb.amazonaws.com."
    zone_id = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_chandika_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "chandika.18f.gov."
  type = "A"
  alias {
    name = "d1vqiz8w0x796c.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_climate-data-user-study_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "climate-data-user-study.18f.gov."
  type = "A"
  alias {
    name = "dgkam57c0xckv.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_compliance-viewer_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "compliance-viewer.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["d1ij48sfge1oxq.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_dnssec_18f_gov_ns" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "dnssec.18f.gov."
  type = "NS"
  ttl = 300
  records = ["hope.ns.cloudflare.com", "phil.ns.cloudflare.com"]
}

resource "aws_route53_record" "18f_gov_federalist-docs_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-docs.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["dzsv3da805tbo.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_85333a5c6cd71f56532894c3c64666ca_federalist-docs_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "85333a5c6cd71f56532894c3c64666ca.federalist-docs.18f.gov."
  type = "CNAME"
  ttl = 5
  records = ["2f82c52f5ec6d2673b02122f6a68f819422b2d2a.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_files_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "files.18f.gov."
  type = "A"
  alias {
    name = "d3gawctq7ecsbu.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_fpki_18f_gov_ns" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "fpki.18f.gov."
  type = "NS"
  ttl = 300
  records = ["ns-521.awsdns-01.net.", "ns-1566.awsdns-03.co.uk.", "ns-1471.awsdns-55.org.", "ns-161.awsdns-20.com."]
}

resource "aws_route53_record" "18f_gov_fugacious_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "fugacious.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dualstack.production-star-18f-gov-elb-1963420885.us-gov-west-1.elb.amazonaws.com"]
}

resource "aws_route53_record" "18f_gov_grafana_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "grafana.18f.gov."
  type = "A"
  alias {
    name = "dualstack.18f-grafana-1906882244.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_green_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "green.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-green-elb-1b9dvw4o0ubi0-1450531403.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_2a8fddd1983327b36b44a57664b8b5d2_green_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "2a8fddd1983327b36b44a57664b8b5d2.green.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["79feafed26b7825cfc2efdb2a43c067b6563d81d.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_star_green_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "*.green.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-green-elb-1b9dvw4o0ubi0-1450531403.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_star_apps_green_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "*.apps.green.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-green-elb-1b9dvw4o0ubi0-1450531403.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_star_sys_green_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "*.sys.green.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-green-elb-1b9dvw4o0ubi0-1450531403.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_guides_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "guides.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dvtze1xj8nrwl.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_handbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "handbook.18f.gov."
  type = "A"
  alias {
    name = "d3jf1ni5noewwb.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_jobs_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "jobs.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["d2o3l1lqmcr15h.cloudfront.net."]
}

resource "aws_route53_record" "18f_gov_join_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "join.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dpjnqahvua4qy.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_methods_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "methods.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["d1z8tmjf5ismhl.cloudfront.net."]
}

resource "aws_route53_record" "18f_gov_micropurchase-staging_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase-staging.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-elb-elb-155eqjkdtn55i-611685241.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_micropurchase-staging_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase-staging.18f.gov."
  type = "MX"
  ttl = 300
  records = ["10 30288227.in1.mandrillapp.com", "20 30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "18f_gov_micropurchase-staging_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase-staging.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "18f_gov_mandrill__domainkey_micropurchase-staging_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "mandrill._domainkey.micropurchase-staging.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "18f_gov_micropurchase_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-elb-elb-155eqjkdtn55i-611685241.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_micropurchase_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase.18f.gov."
  type = "MX"
  ttl = 300
  records = ["10 30288227.in1.mandrillapp.com", "20 30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "18f_gov_micropurchase_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "18f_gov_mandrill__domainkey_micropurchase_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "mandrill._domainkey.micropurchase.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "18f_gov_modularcontracting_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "modularcontracting.18f.gov."
  type = "A"
  alias {
    name = "d11w439dwgnp73.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_f7e29cc5db78cb18f966a29c41c774ea_modularcontracting_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "f7e29cc5db78cb18f966a29c41c774ea.modularcontracting.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["bad1dc780e23fdab0c6363665d42e888c3edeb6c.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_munki_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "munki.18f.gov."
  type = "A"
  ttl = 300
  records = ["52.21.64.47"]
}

resource "aws_route53_record" "18f_gov_e02bc03821dff6c0c958b96ad4476517_munki_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "e02bc03821dff6c0c958b96ad4476517.munki.18f.gov."
  type = "CNAME"
  ttl = 5
  records = ["d3a976c8a19db425a0b6fab24f793df8c0341d67.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_openopps-staging_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "openopps-staging.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-elb-elb-155eqjkdtn55i-611685241.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_openopps-staging_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "openopps-staging.18f.gov."
  type = "MX"
  ttl = 300
  records = ["10	30288227.in1.mandrillapp.com", "20	30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "18f_gov_openopps-staging_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "openopps-staging.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "18f_gov_mandrill__domainkey_openopps-staging_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "mandrill._domainkey.openopps-staging.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "18f_gov_openopps-test_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "openopps-test.18f.gov."
  type = "A"
  alias {
    name = "dualstack.cf-elb-elb-155eqjkdtn55i-611685241.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_openopps-test_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "openopps-test.18f.gov."
  type = "MX"
  ttl = 300
  records = ["10	30288227.in1.mandrillapp.com", "20	30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "18f_gov_openopps-test_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "openopps-test.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "18f_gov_mandrill__domainkey_openopps-test_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "mandrill._domainkey.openopps-test.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "18f_gov_pages_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "pages.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dvtze1xj8nrwl.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_requests_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "requests.18f.gov."
  type = "A"
  alias {
    name = "dualstack.production-star-18f-gov-elb-1963420885.us-gov-west-1.elb.amazonaws.com."
    zone_id = "Z33AYJ8TM3BH4J"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_requests_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "requests.18f.gov."
  type = "MX"
  ttl = 300
  records = ["10 30288227.in1.mandrillapp.com", "20 30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "18f_gov_requests_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "requests.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "18f_gov_mandrill__domainkey_requests_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "mandrill._domainkey.requests.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "18f_gov_tmate_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "tmate.18f.gov."
  type = "A"
  ttl = 300
  records = ["52.22.14.222"]
}

resource "aws_route53_record" "18f_gov_tock_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "tock.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dualstack.production-star-18f-gov-elb-1963420885.us-gov-west-1.elb.amazonaws.com"]
}

resource "aws_route53_record" "18f_gov_www_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "www.18f.gov."
  type = "A"
  alias {
    name = "d1undivnru8ry9.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_74f23ac1efe88323e0ec84b56921077e_www_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "74f23ac1efe88323e0ec84b56921077e.www.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["88b7d18d8d24e3b6d539ea7ecbbf719f8af14e5a.comodoca.com."]
}

output "18f_gov_ns" {
  value="${aws_route53_zone.18f_gov_zone.name_servers}"
}
