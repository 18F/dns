
# TTS DNS configuration

[![CircleCI](https://circleci.com/gh/18F/dns.svg?branch=master&style-svg)](https://circleci.com/gh/18F/dns)

This repository holds the source code for configuring DNS for domains managed by GSA TTS, including 18F and the Presidential Innovation Fellows.

[![dns-pipeline](https://user-images.githubusercontent.com/20934414/34623560-7dd34d3c-f217-11e7-95fd-1cc8236d4b5b.png)](https://github.com/18F/Infrastructure/wiki/DNS-architecture)

## Making changes

1. Is the domain pointing to the right nameservers? In other words, is there a file for the domain under [`terraform/`](terraform) already?
    * **Yes:** Continue to next step.
    * **No:**
        1. Add a file for the domain (or subdomain, if the second-level domain isn't being added), to create the [public hosted zone](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingHostedZone.html).
            * [`18f.us`](terraform/18f.us.tf) is a good example to copy from.
            * You'll be using Terraform's [`aws_route53_zone`](https://www.terraform.io/docs/providers/aws/d/route53_zone.html).
        1. After the pull request is merged, to get the name servers for your domain check the output for your build in [CircleCI](https://circleci.com/gh/18F/dns).  If you need further assistance, check with [#admins-dns](https://gsa-tts.slack.com/messages/C4L58EQ5T).
        1. Change the nameservers for the domain to point to AWS.
            * For `.gov` domains, this will be done by the "domain manager" in [dotgov.gov](https://www.dotgov.gov/). The domain manager is likely someone in the respective agency's IT department.
1. Add the relevant additional [record sets](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/rrsets-working-with.html). In Terraform, these are known as [`aws_route53_record`](https://www.terraform.io/docs/providers/aws/r/route53_record.html)s. Generally speaking, the required arguments are:
    * `zone_id`
    * `name`
    * `type`
    * Either `alias` or `records`
    * If `alias`, then `evaluate_target_health` is also required and `ttl` is not allowed.
    * If `records`, then `ttl` is also required and `evaluate_target_health` is not allowed.

It's worth noting that if you are pointing to a CloudFront distro, you should use Route 53's own `alias` and not a CNAME record. In fact, CNAMEing a top-level domain (or the top level of a delegated subdomain) is not allowed in DNS. See the various examples in the repo, such as [this one](https://github.com/18F/dns/blob/deploy/terraform/usa.gov.tf#L8-L17).

On merge, changes are deployed to an AWS account hosting the Route53 records automatically by a [CircleCI](https://circleci.com/gh/18F/dns) job.

**Please note: only production systems with an ATO should have their DNS configuration here. If you wish to create DNS records for pre-production systems, please use the domain `sandbox.gov` which is available in the [TTS Sandbox account](https://pages.18f.gov/before-you-ship/infrastructure/sandbox/).**

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in the [license](LICENSE.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
