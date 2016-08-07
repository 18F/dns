variable "env_name" {}

resource "aws_route53_zone" "code_toplevel" {
   name = "code.gov"

   tags {
     Project = "dns"
   }
}

output "code_ns" {
    value="${aws_route53_zone.code_toplevel.name_servers}"
}
