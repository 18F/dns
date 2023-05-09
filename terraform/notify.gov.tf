resource "aws_route53_zone" "notify_gov_zone" {
    name = "notify.gov."

    tags = {
        Project = "dns"
    }
}

resource "aws_route53_record" "notify_gov_beta_acmechallenge" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "_acme-challenge.beta"
    type = "CNAME"

    ttl = 600
    records = ["_acme-challenge.beta.notify.gov.external-domains-production.cloud.gov"]
}

resource "aws_route53_record" "notify_gov_beta_cname" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "beta"
    type = "CNAME"

    ttl = 600
    records = ["beta.notify.gov.external-domains-production.cloud.gov"]
}

resource "aws_route53_record" "notify_gov_dkim0" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "eku6g65dhk3u5cl7hnj2o7vplsct3zky._domainkey"
    type = "CNAME"

    ttl = 600
    records = ["eku6g65dhk3u5cl7hnj2o7vplsct3zky.dkim.amazonses.com"]
}

resource "aws_route53_record" "notify_gov_dkim1" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "an4gup5xe6a567hnjdyobxxqysuqirsj._domainkey"
    type = "CNAME"

    ttl = 600
    records = ["an4gup5xe6a567hnjdyobxxqysuqirsj.dkim.amazonses.com"]
}

resource "aws_route53_record" "notify_gov_dkim2" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "uf3w5htg3qjj4ehgf2ntgewzey7a2zt2._domainkey"
    type = "CNAME"

    ttl = 600
    records = ["uf3w5htg3qjj4ehgf2ntgewzey7a2zt2.dkim.amazonses.com"]
}

resource "aws_route53_record" "notify_gov_dmarc" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "_dmarc"
    type = "TXT"

    ttl = 600
    records = ["v=DMARC1; p=quarantine; rua=mailto:notify-support@gsa.gov; ruf=mailto:notify-support@gsa.gov"]
}

resource "aws_route53_record" "notify_gov_spf" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "mail"
    type = "TXT"

    ttl = 600
    records = ["v=spf1 include:amazonses.com -all"]
}

resource "aws_route53_record" "notify_gov_mx" {
    zone_id = aws_route53_zone.notify_gov_zone.zone_id
    name = "mail"
    type = "MX"

    ttl = 600
    records = ["10 feedback-smtp.us-gov-west-1.amazonses.com"]
}

output "notify_gov_ns" {
    value = aws_route53_zone.notify_gov_zone.name_servers
}
