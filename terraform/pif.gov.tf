provider "aws" {
    region = "us-east-1"
}

variable "env_name" {}

resource "aws_route53_zone" "pif_toplevel" {
   name = "pif.gov"

   tags {
     Project = "dns"
   }
}

output "pif_ns" {
    value="${aws_route53_zone.pif_toplevel.name_servers}"
}