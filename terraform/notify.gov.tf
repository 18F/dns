resource "aws_route53_zone" "notify_gov_zone" {
    name = "notify.gov."

    tags = {
        Project = "dns"
    }
}
