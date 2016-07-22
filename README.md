= TTS DNS configuration

This repository holds the source code for configuring DNS for domains managed by GSA TTS, including 18F and the Presidential Innovation Fellows.

The code is in the `terraform` directory, with one file for each zone. To submit a change, make a pull request to the `deploy` branch. On merge, changes are deployed to production automatically by an instance of [raktabija](https://github.com/18F/). Raktabija's CI server runs `bash deploy` against the `deploy` branch of this repository upon any change. We use [Terraform](https://www.terraform.io/) to manage and deploy our DNS configuration.
