/*
    To keep this repo clean and organized, we are keeping all of the sitesusa
    dns records here.
 */
 resource "aws_route53_zone" "sitesusa_app_cloud_gov_zone" {
   name = "sitesusa.app.cloud.gov."
   tags {
     Project = "dns"
   }
 }


resource "aws_route53_record" "fedramp_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "fedramp.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3gjm6t6jb175l.cloudfront.net."]
}

resource "aws_route53_record" "digitalgov_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "digitalgov.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3hymt3g9spfr9.cloudfront.net."]
}

resource "aws_route53_record" "fcsm_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "fcsm.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d173dsmb632nwm.cloudfront.net."]
}

resource "aws_route53_record" "dotgov_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "dotgov.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2ol7xmol1sxnc.cloudfront.net."]
}

resource "aws_route53_record" "twa800_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "twa800.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d89oax5zkbry7.cloudfront.net."]
}

resource "aws_route53_record" "isdc_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "isdc.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3vh86k35tzs9e.cloudfront.net."]
}

resource "aws_route53_record" "fedstats_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "fedstats.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3pbl14kqia7j2.cloudfront.net."]
}

resource "aws_route53_record" "eliminatechildabusefatalities_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "eliminatechildabusefatalities.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2wa84cfht49od.cloudfront.net."]
}

resource "aws_route53_record" "opahit_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "opahit.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2ti8q4kw8kece.cloudfront.net."]
}

resource "aws_route53_record" "crazyhat_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "crazyhat.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["dzq5ezcndsfsa.cloudfront.net."]
}

resource "aws_route53_record" "ethics_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "ethics.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2s6wauw4dbp16.cloudfront.net."]
}

resource "aws_route53_record" "advisethepresident_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "advisethepresident.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["dzqp6w0vkciol.cloudfront.net."]
}

resource "aws_route53_record" "iciwarm_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "iciwarm.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["dcitomnpct9vu.cloudfront.net."]
}

resource "aws_route53_record" "pianc_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "pianc.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2eswcqntq9tec.cloudfront.net."]
}

resource "aws_route53_record" "blmca_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "blmca.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d18ye6628rdkj3.cloudfront.net."]
}

resource "aws_route53_record" "publicparticipation_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "publicparticipation.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1qwezgnywdv7z.cloudfront.net."]
}

resource "aws_route53_record" "newtech4fedlib_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "newtech4fedlib.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1snz8roih34ty.cloudfront.net."]
}

resource "aws_route53_record" "summit_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "summit.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2ijm9ztt6ctgg.cloudfront.net."]
}

resource "aws_route53_record" "ors_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "ors.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2i2hcmnhhn1gu.cloudfront.net."]
}

resource "aws_route53_record" "crowdsourcing-toolkit_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "crowdsourcing-toolkit.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3rlkmvha3f7pl.cloudfront.net."]
}

resource "aws_route53_record" "advocacysba_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "advocacysba.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1x2klhzf52nox.cloudfront.net."]
}

resource "aws_route53_record" "toydodea_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "toydodea.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1m0is9rgx5f52.cloudfront.net."]
}

resource "aws_route53_record" "nihseniorhealth_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "nihseniorhealth.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d22nw1zznd7ull.cloudfront.net."]
}

resource "aws_route53_record" "manufacturing_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "manufacturing.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2xvfjdn28d0qs.cloudfront.net."]
}

resource "aws_route53_record" "feedback_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "feedback.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2pyr1a4hw255j.cloudfront.net."]
}

resource "aws_route53_record" "armyengineerhistory_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "armyengineerhistory.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2ujvc3fvb919k.cloudfront.net."]
}

resource "aws_route53_record" "womenbizinfo_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "womenbizinfo.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1cos5s2xnwzpv.cloudfront.net."]
}

resource "aws_route53_record" "commissiononcare_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "commissiononcare.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1i033ms5azhe.cloudfront.net."]
}

resource "aws_route53_record" "sbalearning_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "sbalearning.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2rd97xfcsk48i.cloudfront.net."]
}

resource "aws_route53_record" "presidentialtransition_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "presidentialtransition.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1rqyj2yob9arf.cloudfront.net."]
}

resource "aws_route53_record" "uspto-dev-blog_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "uspto-dev-blog.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d28conmpyjrx42.cloudfront.net."]
}

resource "aws_route53_record" "52weeks4women_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "52weeks4women.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d12v5zh80whptw.cloudfront.net."]
}

resource "aws_route53_record" "civilrights_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "civilrights.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2p5sm7piy8hyn.cloudfront.net."]
}

resource "aws_route53_record" "nsta_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "nsta.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2kc04noc3g157.cloudfront.net."]
}

resource "aws_route53_record" "ussm_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "ussm.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2zeuk52vop2m1.cloudfront.net."]
}

resource "aws_route53_record" "citizenscience_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "citizenscience.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d14h3zbfoxnlbd.cloudfront.net."]
}

resource "aws_route53_record" "communitysolutions_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "communitysolutions.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2shhl1m4kf8sy.cloudfront.net."]
}

resource "aws_route53_record" "akamaitest_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "akamaitest.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d25p97zz7oomej.cloudfront.net."]
}

resource "aws_route53_record" "blm_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "blm.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1jo0f6cbg1d05.cloudfront.net."]
}

resource "aws_route53_record" "mip_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "mip.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3937bwai69yxa.cloudfront.net."]
}

resource "aws_route53_record" "privacy_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "privacy.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2moi27garks9e.cloudfront.net."]
}

resource "aws_route53_record" "cio_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "cio.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3l9veg4o1omhy.cloudfront.net."]
}

resource "aws_route53_record" "wellness_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "wellness.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3muasq47exin3.cloudfront.net."]
}

resource "aws_route53_record" "trust_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "trust.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1wqojscappq8s.cloudfront.net."]
}

resource "aws_route53_record" "taxdesignchallenge_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "taxdesignchallenge.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d1yrz6cljgdind.cloudfront.net."]
}

resource "aws_route53_record" "nidanrb_sitesusa_app_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.sitesusa_app_cloud_gov_zone}"
  name = "nidanrb.sitesusa.app.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d3chp99iuj1c5n.cloudfront.net."]
}


output "sitesusa_app_cloud_gov_ns" {
  value = "${aws_route53_zone.sitesusa_app_cloud_gov_zone.name_servers}"
}
