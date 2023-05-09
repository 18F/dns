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

output "notify_gov_ns" {
    value = aws_route53_zone.notify_gov_zone.name_servers
}
