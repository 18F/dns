# TTS DNS configuration

[![Build Status](https://travis-ci.org/18F/dns.svg?branch=master)](https://travis-ci.org/18F/dns)

This repository holds the source code for configuring DNS for domains managed by GSA TTS, including 18F and the Presidential Innovation Fellows.

The code is in the `terraform` directory, with one file for each zone. To submit a change, make a pull request to the `deploy` branch. On merge, changes are deployed to production automatically by an instance of [raktabija](https://github.com/18F/raktabija). Raktabija's CI server runs `bash deploy` against the `deploy` branch of this repository upon any change. We use [Terraform](https://www.terraform.io/) to manage and deploy our DNS configuration.

**Please note: only production systems with an ATO should have their DNS configuration here. If you wish to create DNS records for pre-production systems, please use the domain `sandbox.gov` which is available in the [TTS Sandbox account](https://pages.18f.gov/before-you-ship/infrastructure/sandbox/).** 

## Public domain

This project is in the worldwide [public domain](LICENSE.md). As stated in the [license](LICENSE.md):

> This project is in the public domain within the United States, and copyright and related rights in the work worldwide are waived through the [CC0 1.0 Universal public domain dedication](https://creativecommons.org/publicdomain/zero/1.0/).

> All contributions to this project will be released under the CC0 dedication. By submitting a pull request, you are agreeing to comply with this waiver of copyright interest.
