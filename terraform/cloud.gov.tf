variable "cloudfoundry_elb_logging_staging" {
  default = "dualstack.staging-CloudFoundry-Logging-538826588.us-gov-west-1.elb.amazonaws.com"
}
variable "cloudfoundry_elb_logging_production" {
  default = "dualstack.production-CloudFoundry-Logging-910586631.us-gov-west-1.elb.amazonaws.com"
}

variable "elb_prometheus_staging" {
  default = "dualstack.staging-Prometheus-658384006.us-gov-west-1.elb.amazonaws.com"
}
variable "elb_prometheus_production" {
  default = "dualstack.production-Prometheus-1971082399.us-gov-west-1.elb.amazonaws.com"
}

resource "aws_route53_zone" "cloud_gov_zone" {
  name = "cloud.gov."
  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "cloud_gov_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "cloud.gov."
  type = "A"
  alias {
    name = "d2vy872d33xc5d.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "cloud.gov."
  type = "AAAA"
  alias {
    name = "d2vy872d33xc5d.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_cloud_gov_mx" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "cloud.gov."
  type = "MX"
  ttl = 300
  records = ["10 30288227.in1.mandrillapp.com", "20 30288227.in2.mandrillapp.com"]
}

resource "aws_route53_record" "cloud_gov_cloud_gov_txt" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "cloud.gov."
  type = "TXT"
  ttl = 300
  records = ["v=spf1 include:spf.mandrillapp.com ?all"]
}

resource "aws_route53_record" "cloud_gov_2a37e22b1f41ad3fe6af39f4fc38c1bc_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "2a37e22b1f41ad3fe6af39f4fc38c1bc.cloud.gov."
  type = "CNAME"
  ttl = 5
  records = ["ac6c3680280b90d562df4de77465b14f900463b0.comodoca.com."]
}

resource "aws_route53_record" "cloud_gov_dc8dffe0fd99c8d067ce1bb5ef156f3e_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "dc8dffe0fd99c8d067ce1bb5ef156f3e.dev.us-gov-west-1.aws-us-gov.cloud.gov."
  type = "CNAME"
  ttl = 5
  records = ["4c76d956c990d92cf796eff553d6926e22570fa2.comodoca.com."]
}

resource "aws_route53_record" "cloud_gov_star_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.cloud-gov-cf-e-elb-1k4d82us0nuuh-2031658718.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.cloud-gov-cf-e-elb-1k4d82us0nuuh-2031658718.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov__amazonses_cloud_gov_txt" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "_amazonses.cloud.gov."
  type = "TXT"
  ttl = 1800
  records = ["JF67Pfn/VmP6BKunf7EvCw4FsYKZJ4wke76M+1+DKZU="]
}

resource "aws_route53_record" "cloud_gov_fg73k4wyobi6u65jndxhy4rfo3a6detw__domainkey_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "fg73k4wyobi6u65jndxhy4rfo3a6detw._domainkey.cloud.gov."
  type = "CNAME"
  ttl = 1800
  records = ["fg73k4wyobi6u65jndxhy4rfo3a6detw.dkim.amazonses.com"]
}

resource "aws_route53_record" "cloud_gov_kjvrruyad34bs6lej4lgqbnotzweekwk__domainkey_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "kjvrruyad34bs6lej4lgqbnotzweekwk._domainkey.cloud.gov."
  type = "CNAME"
  ttl = 1800
  records = ["kjvrruyad34bs6lej4lgqbnotzweekwk.dkim.amazonses.com"]
}

resource "aws_route53_record" "cloud_gov_mandrill__domainkey_cloud_gov_txt" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "mandrill._domainkey.cloud.gov."
  type = "TXT"
  ttl = 300
  records = ["v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCrLHiExVd55zd/IQ/J/mRwSRMAocV/hMB3jXwaHH36d9NaVynQFYV8NaWi69c1veUtRzGt7yAioXqLj7Z4TeEUoOLgrKsn8YnckGs9i3B3tVFB+Ch/4mPhXWiNfNdynHWBcPcbJ8kjEQ2U8y78dHZj1YeRXXVvWob2OaKynO8/lQIDAQAB;"]
}

resource "aws_route53_record" "cloud_gov_z7gdeervmegvbx6m3qrnpl5qxftrfoda__domainkey_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "z7gdeervmegvbx6m3qrnpl5qxftrfoda._domainkey.cloud.gov."
  type = "CNAME"
  ttl = 1800
  records = ["z7gdeervmegvbx6m3qrnpl5qxftrfoda.dkim.amazonses.com"]
}

resource "aws_route53_record" "cloud_gov_4a06e9b08bec03251745266a2878c1fd_apps_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "4a06e9b08bec03251745266a2878c1fd.apps.cloud.gov."
  type = "CNAME"
  ttl = 5
  records = ["b179f6775377ddd3532e842093466e34bb283f3e.comodoca.com."]
}

resource "aws_route53_record" "cloud_gov_star_apps_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.apps.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.apps-cloud-gov-elb-61sw6opptxk9-195873614.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_apps_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.apps.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.apps-cloud-gov-elb-61sw6opptxk9-195873614.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_ci-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "ci-stage.cloud.gov."
  type = "A"
  alias {
    name = "ci-toolin-concours-1xrgg0ivxcpf5-70148341.us-east-1.elb.amazonaws.com."
    zone_id = "Z3DZXE0Q79N41H"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_ci_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "ci.cloud.gov."
  type = "A"
  alias {
    name = "ci-toolin-concours-1s5jdz0uyrntu-528279406.us-east-1.elb.amazonaws.com."
    zone_id = "Z3DZXE0Q79N41H"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_community_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "community.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2keufenac9p5u.cloudfront.net."]
}

resource "aws_route53_record" "cloud_gov_compliance_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "compliance.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["dftr9yjllgf5s.cloudfront.net."]
}

resource "aws_route53_record" "cloud_gov_concourse-ta77wii7_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "concourse-ta77wii7.cloud.gov."
  type = "A"
  alias {
    name = "cf-concou-concours-micv3o3xldci-2040395208.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_docs-fix_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "docs-fix.cloud.gov."
  type = "CNAME"
  ttl = 300
  records = ["docs.apps.cloud.gov"]
}

resource "aws_route53_record" "cloud_gov_docs_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "docs.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2knjq618810db.cloudfront.net."]
}

resource "aws_route53_record" "cloud_gov_62c5ba6eb10ba1eec8fffd32f9a3cb7d_fr-stage_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "62c5ba6eb10ba1eec8fffd32f9a3cb7d.fr-stage.cloud.gov."
  type = "CNAME"
  ttl = 5
  records = ["85b89d69fb926ddcd519063c645fff5dbd29a95f.comodoca.com."]
}

resource "aws_route53_record" "cloud_gov_star_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.staging-cloudfoundry-main-496592480.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_fr-stage_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.staging-cloudfoundry-main-496592480.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_metrics_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "metrics.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.staging-monitoring-1064664786.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_prometheus_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "prometheus.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "${var.elb_prometheus_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_prometheus_fr-stage_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "prometheus.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.elb_prometheus_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_alertmanager_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "alertmanager.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "${var.elb_prometheus_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_alertmanager_fr-stage_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "alertmanager.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.elb_prometheus_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_grafana_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "grafana.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "${var.elb_prometheus_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_grafana_fr-stage_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "grafana.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.elb_prometheus_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_ssh_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "ssh.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.staging-diego-proxy-1166959673.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_39e7c230acbbc55a537f450483f715f9_fr_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "39e7c230acbbc55a537f450483f715f9.fr.cloud.gov."
  type = "CNAME"
  ttl = 5
  records = ["86c6cd8ef448865fc0ea0de3913d4e79ecccbdbc.comodoca.com."]
}

resource "aws_route53_record" "cloud_gov_star_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.production-cloudfoundry-main-748290002.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.production-cloudfoundry-main-748290002.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_app_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.app.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.production-cloudfoundry-apps-1021484088.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_app_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.app.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.production-cloudfoundry-apps-1021484088.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_ci-stage_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "ci.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.tooling-concourse-us-gov-west-1b-1960601158.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_ci_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "ci.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.tooling-concourse-us-gov-west-1a-1700142089.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_loggregator-stage_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "loggregator.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "${var.cloudfoundry_elb_logging_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_loggregator-stage_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "loggregator.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.cloudfoundry_elb_logging_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_loggregator_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "loggregator.fr.cloud.gov."
  type = "A"
  alias {
    name = "${var.cloudfoundry_elb_logging_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_loggregator_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "loggregator.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.cloudfoundry_elb_logging_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_doppler-stage_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "doppler.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "${var.cloudfoundry_elb_logging_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_doppler-stage_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "doppler.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.cloudfoundry_elb_logging_staging}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_doppler_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "doppler.fr.cloud.gov."
  type = "A"
  alias {
    name = "${var.cloudfoundry_elb_logging_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_doppler_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "doppler.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.cloudfoundry_elb_logging_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_concourse-ci_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "concourse-ci.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.staging-concourse-us-gov-west-1b-1233466952.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_concourse-ci_fr-stage_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "concourse-ci.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.staging-concourse-us-gov-west-1b-1233466952.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_concourse-ci_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "concourse-ci.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.production-Concourse-us-gov-west-840829531.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_concourse-ci_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "concourse-ci.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.production-Concourse-us-gov-west-840829531.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_metrics_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "metrics.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.production-monitoring-1367072254.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_prometheus_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "prometheus.fr.cloud.gov."
  type = "A"
  alias {
    name = "${var.elb_prometheus_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_prometheus_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "prometheus.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.elb_prometheus_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_alertmanager_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "alertmanager.fr.cloud.gov."
  type = "A"
  alias {
    name = "${var.elb_prometheus_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_alertmanager_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "alertmanager.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.elb_prometheus_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_grafana_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "grafana.fr.cloud.gov."
  type = "A"
  alias {
    name = "${var.elb_prometheus_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_grafana_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "grafana.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "${var.elb_prometheus_production}"
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_nessus_fr_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "nessus.fr.cloud.gov."
  type = "CNAME"
  ttl = 300
  records = ["tooling-Nessus-1910336072.us-gov-west-1.elb.amazonaws.com"]
}

resource "aws_route53_record" "cloud_gov_ssh_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "ssh.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.production-diego-proxy-548237188.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_ops_uaa_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "opsuaa.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.tooling-bosh-uaa-1089350571.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_ops_login_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "opslogin.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.tooling-bosh-uaa-1089350571.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_idp_fr-stage_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "idp.fr-stage.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.staging-shibboleth-proxy-1940540040.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_idp_fr-stage_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "idp.fr-stage.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.staging-shibboleth-proxy-1940540040.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_idp_fr_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "idp.fr.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.production-shibboleth-proxy-1152328295.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_idp_fr_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "idp.fr.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.production-shibboleth-proxy-1152328295.us-gov-west-1.elb.amazonaws.com."
    zone_id = "${var.cloudfront_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_green_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "green.cloud.gov."
  type = "A"
  alias {
    name = "cf-green-ELB-1B9DVW4O0UBI0-1450531403.us-east-1.elb.amazonaws.com."
    zone_id = "Z3DZXE0Q79N41H"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_green_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.green.cloud.gov."
  type = "A"
  alias {
    name = "cf-green-ELB-1B9DVW4O0UBI0-1450531403.us-east-1.elb.amazonaws.com."
    zone_id = "Z3DZXE0Q79N41H"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_login-cname_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "login-cname.cloud.gov."
  type = "CNAME"
  ttl = 300
  records = ["login.sys.cloud.gov"]
}

resource "aws_route53_record" "cloud_gov_metrics_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "metrics.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.grafana-prod-810970021.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_nessus_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "nessus.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.cf-toolin-nessusel-3pwwpgy9wogs-1694656117.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_sys_cloud_gov_a" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.sys.cloud.gov."
  type = "A"
  alias {
    name = "dualstack.apps-cloud-gov-elb-61sw6opptxk9-195873614.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_star_sys_cloud_gov_aaaa" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "*.sys.cloud.gov."
  type = "AAAA"
  alias {
    name = "dualstack.apps-cloud-gov-elb-61sw6opptxk9-195873614.us-east-1.elb.amazonaws.com."
    zone_id = "Z35SXDOTRQ7X7K"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloud_gov_www_cloud_gov_cname" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "www.cloud.gov."
  type = "CNAME"
  ttl = 60
  records = ["d2vy872d33xc5d.cloudfront.net."]
}

resource "aws_route53_record" "cdn_broker_delegate" {
  zone_id = "${aws_route53_zone.cloud_gov_zone.zone_id}"
  name = "cdn-broker-test.cloud.gov."
  type = "NS"
  ttl = 300
  records = [
    "ns-1999.awsdns-57.co.uk.",
    "ns-1182.awsdns-19.org.",
    "ns-243.awsdns-30.com.",
    "ns-651.awsdns-17.net."
  ]
}

output "cloud_gov_ns" {
  value = "${aws_route53_zone.cloud_gov_zone.name_servers}"
}
