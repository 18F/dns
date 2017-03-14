# TTS DNS configuration

[![Build Status](https://travis-ci.org/18F/dns.svg?branch=deploy)](https://travis-ci.org/18F/dns)

This repository holds the source code for configuring DNS for domains managed by GSA TTS, including 18F and the Presidential Innovation Fellows.

## Making changes

1. Is the domain pointing to the right nameservers? In other words, is there a file for the domain under [`terraform/`](terraform) already?
    * **Yes:** Continue to next step.
    * **No:**
        1. If you're only setting up a subdomain (rather than a second-level), incorporate [these special steps](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingNewSubdomain.html) to the following.
        1. Add a file for the domain, to create the [public hosted zone](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingHostedZone.html).
            * [`18f.us`](terraform/18f.us.tf) is a good example to copy from.
            * You'll be using Terraform's [`aws_route53_zone`](https://www.terraform.io/docs/providers/aws/d/route53_zone.html).
        1. After the pull request is merged, ask in [#infrastructure](https://gsa-tts.slack.com/messages/infrastructure/) to get the nameservers for your domain from [Concourse](https://concourse-ci.fr.cloud.gov/teams/gsa-tts-infrastructure/pipelines/dns-prod/).
        1. Change the nameservers for the domain to point to AWS.
            * For `.gov` domains, this will be done by whatever person/group registered/manages the domain in [dotgov.gov](https://www.dotgov.gov/).
1. Add the relevant additional [record sets](http://docs.aws.amazon.com/Route53/latest/DeveloperGuide/rrsets-working-with.html). In Terraform, these are known as [`aws_route53_record`](https://www.terraform.io/docs/providers/aws/r/route53_record.html)s. 
    * Generally speaking, the required arguments are:
        1. `zone_id`
	1. `name`
	1. `type`
	1. Either `alias` or `records`
	1. If `alias`, then `evaluate_target_health` is also required
	1. If `records`, then `ttl` is also required

On merge, changes are deployed to the cloud.gov AWS account automatically by an instance of Concourse hosted on [cloud.gov](https://cloud.gov). The configuration for the Concourse instance is in `pipeline.yml`.

**Please note: only production systems with an ATO should have their DNS configuration here. If you wish to create DNS records for pre-production systems, please use the domain `sandbox.gov` which is available in the [TTS Sandbox account](https://pages.18f.gov/before-you-ship/infrastructure/sandbox/).**

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in the [license](LICENSE.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
