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
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_amazonses_18f_gov_mx" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "amazonses.18f.gov."
  type = "MX"
  ttl = 300
  records = ["10 feedback-smtp.us-east-1.amazonses.com"]
}

resource "aws_route53_record" "18f_gov_amazonses_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "amazonses.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:amazonses.com ~all"]
}

resource "aws_route53_record" "18f_gov_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "18f.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.spf_no_mail}"]
}

resource "aws_route53_record" "18f_gov__dmarc_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "_dmarc.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["${local.dmarc_reject}"]
}

resource "aws_route53_record" "18f_gov__acme-challenge_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "_acme-challenge.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["pEkgOBDXa7LJqQhnniOe_AIN1tgSObw3kX6y32t34sA"]
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

resource "aws_route53_record" "18f_gov_qegrzvzekq4wiompgqufe4xwmarm37lh__domainkey_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "qegrzvzekq4wiompgqufe4xwmarm37lh._domainkey.18f.gov."
  type = "CNAME"
  ttl = 1800
  records = ["qegrzvzekq4wiompgqufe4xwmarm37lh.dkim.amazonses.com"]
}

# Individual site records start here, alphabetized by subdomain name

resource "aws_route53_record" "18f_gov_18franklin_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "18franklin.18f.gov."
  type = "A"
  alias {
    name = "d3n4rzfn59k0a9.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_accessibility_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "accessibility.18f.gov."
  type = "A"
  alias {
    name = "d3gg23ftaba0j8.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_ads_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "ads.18f.gov."
  type = "A"
  alias {
    name = "d1p50apr0w92d2.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_agile-bpa_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "agile-bpa.18f.gov."
  type = "A"
  alias {
    name = "d1isqls256uotf.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_agile_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "agile.18f.gov."
  type = "A"
  alias {
    name = "d2zsago6kfzgka.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_agile-labor-categories_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "agile-labor-categories.18f.gov."
  type = "A"
  alias {
    name = "d1p2fryyhm3d02.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_api_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "api.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["18f.domains.api.data.gov"]
}

resource "aws_route53_record" "18f_gov_acqstack-journeymap_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "acqstack-journeymap.18f.gov."
  type = "A"
  alias {
    name = "d283vwqoe38bia.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_api-all-the-x_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "api-all-the-x.18f.gov."
  type = "A"
  alias {
    name = "d32jbnyri5gz15.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_api-program_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "api-program.18f.gov."
  type = "A"
  alias {
    name = "d1o273cx53rx83.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_api-usability-testing_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "api-usability-testing.18f.gov."
  type = "A"
  alias {
    name = "d3u1jtugc2nkl7.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_atf-eregs_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "atf-eregs.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["d1a8iv0i0iazmn.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_atul-docker-presentation_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "atul-docker-presentation.18f.gov."
  type = "A"
  alias {
    name = "dndsei0n82g4z.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_autoapi_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "autoapi.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["d31k5ro0ea9ojq.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_automated-testing-playbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "automated-testing-playbook.18f.gov."
  type = "A"
  alias {
    name = "d77j39fvc23g2.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_blogging-guide_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "blogging-guide.18f.gov."
  type = "A"
  alias {
    name = "d12gmeaikmi2zi.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_before-you-ship_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "before-you-ship.18f.gov."
  type = "A"
  alias {
    name = "daap61vtgsw76.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_boise_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "boise.18f.gov."
  type = "A"
  alias {
    name = "d3va9woazp7hye.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_brand_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "brand.18f.gov."
  type = "A"
  alias {
    name = "d19y688vepyspr.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_c6769c03c29466618a6bd23b158d28a6_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "c6769c03c29466618a6bd23b158d28a6.18f.gov."
  type = "CNAME"
  ttl = 5
  records = ["25dcca43a0e035f9109366532ca4bea5a552e1ba.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_cap_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "cap.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["production-domains-0-589438325.us-gov-west-1.elb.amazonaws.com."]
}

resource "aws_route53_record" "18f_gov_c2_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "c2.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["production-domains-0-589438325.us-gov-west-1.elb.amazonaws.com."]
}

resource "aws_route53_record" "18f_gov_chandika_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "chandika.18f.gov."
  type = "A"
  alias {
    name = "d1vqiz8w0x796c.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_charlie_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "charlie.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["d30i8aauyor9vc.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_chat_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "chat.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["d2yc8l40kkdvr0.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_climate-data-user-study_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "climate-data-user-study.18f.gov."
  type = "A"
  alias {
    name = "d28r76t17zvn4f.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_compliance-viewer_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "compliance-viewer.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dw68mooipdgv2.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_content-guide_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "content-guide.18f.gov."
  type = "A"
  alias {
    name = "dv941ubd2f1ex.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_contracting-cookbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "contracting-cookbook.18f.gov."
  type = "A"
  alias {
    name = "d1fftyxpeen4gs.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_continua11y_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "continua11y.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["dwz1sfldhro5q.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_design-principles-guide_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "design-principles-guide.18f.gov."
  type = "A"
  alias {
    name = "d1z8htfdnj42fu.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_digital-acquisition-playbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "digital-acquisition-playbook.18f.gov."
  type = "A"
  alias {
    name = "d1dov9wu7ayjg9.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_digitalaccelerator_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "digitalaccelerator.18f.gov."
  type = "A"
  alias {
    name = "dyumdy5yvu23d.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_dnssec_18f_gov_ns" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "dnssec.18f.gov."
  type = "NS"
  ttl = 300
  records = ["hope.ns.cloudflare.com", "phil.ns.cloudflare.com"]
}

resource "aws_route53_record" "18f_gov_dolores_app_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "dolores-app.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["dfyuicm8edxex.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_dolores_staging_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "dolores-staging.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["d9d5ti9w8z48u.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_eng-hiring_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "eng-hiring.18f.gov."
  type = "A"
  alias {
    name = "d1ju28lhpbkq84.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_federalist_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["d189ghshxys967.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_federalist-staging_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-staging.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3e7le7trh4ed5.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_federalist-builder_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-builder.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["deej5fwwloisy.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_federalist-docs_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-docs.18f.gov."
  type = "A"
  alias {
    name = "dryn1azf9y010.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_federalist-landing-template_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-landing-template.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2lwrtx2u5nmdw.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_federalist-modern-team-template_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-modern-team-template.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2xyasfn4889hb.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_federalist-report-template_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-report-template.18f.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1ygku4sb90jjr.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_federalist-uswds-template_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "federalist-uswds-template.18f.gov."
  type = "A"
  alias {
    name = "d14safpqycg0pm.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_85333a5c6cd71f56532894c3c64666ca_federalist-docs_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "85333a5c6cd71f56532894c3c64666ca.federalist-docs.18f.gov."
  type = "CNAME"
  ttl = 5
  records = ["2f82c52f5ec6d2673b02122f6a68f819422b2d2a.comodoca.com."]
}

resource "aws_route53_record" "18f_gov_fedspendingtransparency_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "fedspendingtransparency.18f.gov."
  type = "A"
  alias {
    name = "dbdhg5alj9dxm.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_files_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "files.18f.gov."
  type = "A"
  alias {
    name = "d3gawctq7ecsbu.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_frontend_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "frontend.18f.gov."
  type = "A"
  alias {
    name = "d2dhxnk13yje6c.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_fugacious_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "fugacious.18f.gov."
  type = "A"
  alias {
    name = "d309sw0ah4sgku.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_fugacious_18f_gov_txt" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "fugacious.18f.gov."
  type = "TXT"
  ttl = 300
  records = ["d309sw0ah4sgku.cloudfront.net."]
}

resource "aws_route53_record" "18f_gov_govconnect_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "govconnect.18f.gov."
  type = "A"
  alias {
    name = "d1pr8zgciesx6n.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_grafana_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "grafana.18f.gov."
  type = "A"
  alias {
    name = "dualstack.18f-grafana-1906882244.us-east-1.elb.amazonaws.com."
    zone_id = "${local.elb_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_grouplet-playbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "grouplet-playbook.18f.gov."
  type = "A"
  alias {
    name = "d3ry367ji31g0v.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_guides_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "guides.18f.gov."
  type = "A"
  alias {
    name = "d1n7tjr4lotmf0.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_guides-template_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "guides-template.18f.gov."
  type = "A"
  alias {
    name = "d2ydp5mmbpnnqx.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_handbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "handbook.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dtj4n4imxei9y.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_iaa-forms_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "iaa-forms.18f.gov."
  type = "A"
  alias {
    name = "d1ulaoarb8xdr6.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_identity-dev-docs_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "identity-dev-docs.18f.gov."
  type = "A"
  alias {
    name = "d35rhrbvrsocmo.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_innovation-toolkit-prototype_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "innovation-toolkit-prototype.18f.gov."
  type = "A"
  alias {
    name = "d8x9jyjnezbf9.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
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

resource "aws_route53_record" "18f_gov_lean-product-design_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "lean-product-design.18f.gov."
  type = "A"
  alias {
    name = "d2rme39iqpbarz.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_markdown-helper_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "markdown-helper.18f.gov."
  type = "A"
  alias {
    name = "doj9msj2touhw.cloudfront.net."
    zone_id = "${local.cloud_gov_cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_methods_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "methods.18f.gov."
  type = "A"
  alias {
    name = "d2z1u02mjhp26x.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_micropurchase-staging_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase-staging.18f.gov."
  type = "A"
  alias {
    name = "d148p0zbwe5pp7.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

# Configured with CDN Broker
resource "aws_route53_record" "18f_gov_micropurchase_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "micropurchase.18f.gov."
  type = "A"
  alias {
    name = "d2x6i02wsoxhfc.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_modularcontracting_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "modularcontracting.18f.gov."
  type = "A"
  alias {
    name = "d1iyte5ws3y9f8.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
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

resource "aws_route53_record" "18f_gov_onepagetest_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "onepagetest.18f.gov."
  type = "A"
  alias {
    name = "d11sjos2lh2ef3.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_open-source-guide_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "open-source-guide.18f.gov."
  type = "A"
  alias {
    name = "d217cwkdnmo5gb.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_open-source-program_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "open-source-program.18f.gov."
  type = "A"
  alias {
    name = "dmc54lz5wkr6w.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_pages_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "pages.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["dvtze1xj8nrwl.cloudfront.net"]
}

resource "aws_route53_record" "18f_gov_paid-leave-prototype_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "paid-leave-prototype.18f.gov."
  type = "A"
  alias {
    name = "d36xmdc11fynpu.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_partnership-playbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "partnership-playbook.18f.gov."
  type = "A"
  alias {
    name = "dqd8t6xkgtofc.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_performance-gov-research_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "performance-gov-research.18f.gov."
  type = "A"
  alias {
    name = "d3csg01izjywi2.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_plain-language-tutorial_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "plain-language-tutorial.18f.gov."
  type = "A"
  alias {
    name = "d3rznbn2s8vgba.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_private-eye_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "private-eye.18f.gov."
  type = "A"
  alias {
    name = "d3asgf5hc4zmll.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_product-guide_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "product-guide.18f.gov."
  type = "A"
  alias {
    name = "d2ys0ic6txy8sy.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_requests_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "requests.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["production-domains-0-589438325.us-gov-west-1.elb.amazonaws.com."]
}

resource "aws_route53_record" "18f_gov_slides_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "slides.18f.gov."
  type = "A"
  alias {
    name = "d1mbkqkl20dkuc.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_tmate_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "tmate.18f.gov."
  type = "A"
  ttl = 300
  records = ["52.22.14.222"]
}

resource "aws_route53_record" "18f_gov_testing-cookbook_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "testing-cookbook.18f.gov."
  type = "A"
  alias {
    name = "dvw4plzjsccwa.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_tock_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "tock.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["production-domains-1-884689640.us-gov-west-1.elb.amazonaws.com."]
}

resource "aws_route53_record" "18f_gov_writing-lab-guide_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "writing-lab-guide.18f.gov."
  type = "A"
  alias {
    name = "dj4w2wq1t8v3j.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "18f_gov_www_18f_gov_a" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "www.18f.gov."
  type = "A"
  alias {
    name = "d1undivnru8ry9.cloudfront.net."
    zone_id = "${local.cloudfront_zone_id}"
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

resource "aws_route53_record" "18f_gov_e2e080f495caf881194dadb62fb3d5bc_18f_gov_cname" {
  zone_id = "${aws_route53_zone.18f_gov_zone.zone_id}"
  name = "e2e080f495caf881194dadb62fb3d5bc.18f.gov."
  type = "CNAME"
  ttl = 300
  records = ["25aad757d26409f9b764f267283fda0ec6e8e3f1.comodoca.com."]
}

output "18f_gov_ns" {
  value="${aws_route53_zone.18f_gov_zone.name_servers}"
}
