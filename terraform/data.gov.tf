resource "aws_route53_zone" "datagov_zone" {

  name = "data.gov"
  tags = {
    Project = "dns"
  }
}

# Create a KMS key for DNSSEC signing
resource "aws_kms_key" "datagov_zone" {

  # See Route53 key requirements here: 
  # https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring-dnssec-cmk-requirements.html
  customer_master_key_spec = "ECC_NIST_P256"
  deletion_window_in_days  = 7
  key_usage                = "SIGN_VERIFY"
  policy = jsonencode({
    Statement = [
      {
        Action = [
          "kms:DescribeKey",
          "kms:GetPublicKey",
          "kms:Sign",
        ],
        Effect = "Allow"
        Principal = {
          Service = "dnssec-route53.amazonaws.com"
        }
        Sid      = "Allow Route 53 DNSSEC Service",
        Resource = "*"
      },
      {
        Action = "kms:CreateGrant",
        Effect = "Allow"
        Principal = {
          Service = "dnssec-route53.amazonaws.com"
        }
        Sid      = "Allow Route 53 DNSSEC Service to CreateGrant",
        Resource = "*"
        Condition = {
          Bool = {
            "kms:GrantIsForAWSResource" = "true"
          }
        }
      },
      {
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Resource = "*"
        Sid      = "IAM User Permissions"
      },
    ]
    Version = "2012-10-17"
  })
}

# Make it easier for admins to identify the key in the KMS console
resource "aws_kms_alias" "datagov_zone" {
  name          = "alias/DNSSEC-${replace(aws_route53_zone.datagov_zone.name, "/[^a-zA-Z0-9:/_-]/", "-")}"
  target_key_id = aws_kms_key.datagov_zone.key_id
}

resource "aws_route53_key_signing_key" "datagov_zone" {
  hosted_zone_id             = aws_route53_zone.datagov_zone.id
  key_management_service_arn = aws_kms_key.datagov_zone.arn
  name                       = "data.gov"
}

resource "aws_route53_hosted_zone_dnssec" "datagov_zone" {
  depends_on = [
    aws_route53_key_signing_key.datagov_zone
  ]
  hosted_zone_id = aws_route53_key_signing_key.datagov_zone.hosted_zone_id
}
locals {
  datagov_ns_record    = tolist(["NS", "data.gov", "[ ${join(", \n", [for s in aws_route53_zone.datagov_zone.name_servers : format("%q", s)])} ]"])
  datagov_ds_record    = tolist(["DS", "data.gov", aws_route53_key_signing_key.datagov_zone.ds_record])
  datagov_instructions = "Create NS and DS records in the .gov zone with the values indicated."
}
output "datagov_ds_record" {
  depends_on = [
    aws_route53_hosted_zone_dnssec.datagov_zone
  ]
  value = [
    local.datagov_ds_record
  ]
}

output "datagov_ns_record" {
  value = [
    local.datagov_ns_record
  ]
}

output "datagov_instructions" {
  value = local.datagov_instructions
}




resource "aws_route53_record" "datagov_34193244109_a" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "data.gov"
  type    = "A"

  alias {
    name                   = "data.gov.external-domains-production.cloud.gov"
    zone_id                =  local.cloud_gov_cloudfront_zone_id
    evaluate_target_health = false
  }
}


resource "aws_route53_record" "datagov_manage101771786_a" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "manage"
  type    = "A"

  ttl     = 300
  records = ["10.177.17.86"]

}


resource "aws_route53_record" "datagov_originssmallbusiness1981012551_a" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "origins-smallbusiness"
  type    = "A"

  ttl     = 300
  records = ["198.10.125.51"]

}


resource "aws_route53_record" "datagov__caa" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = ""
  type    = "CAA"

  ttl = 300
  records = [
    "0 issue \"awstrust.com\"",
    "0 issue \"lestsencrypt.org\"",
    "0 issue \"amazonaws.com\"",
    "0 issue \"amazontrust.com\"",
    "0 issue \"digicert.com\"",
    "0 issue \"amazon.com\"",
  ]

}


resource "aws_route53_record" "datagov_acmechallengeacmechallengedatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengeagricultureacmechallengeagriculturedatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.agriculture"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.agriculture.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengecatalogacmechallengecatalogdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.catalog"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.catalog.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengeclimateacmechallengeclimatedatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.climate"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.climate.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengedashboardacmechallengedashboarddatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.dashboard"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.dashboard.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengedeveloperacmechallengedeveloperdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.developer"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.developer.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengeenergyacmechallengeenergydatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.energy"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.energy.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengefoodacmechallengefooddatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.food"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.food.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengehighlightsacmechallengehighlightsdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.highlights"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.highlights.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengeinventoryacmechallengeinventorydatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.inventory"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.inventory.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengelabsacmechallengelabsdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.labs"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.labs.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengeoceanacmechallengeoceandatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.ocean"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.ocean.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_acmechallengewwwacmechallengewwwdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.www"
  type    = "CNAME"

  ttl     = 300
  records = ["_acme-challenge.www.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_aapinspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "aapi"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_admincatalogadmincatalogbspdatagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "admin-catalog"
  type    = "CNAME"

  ttl     = 300
  records = ["admin-catalog-bsp.data.gov"]

}


resource "aws_route53_record" "datagov_admincatalogbspnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "admin-catalog-bsp"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_admincatalognextnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "admin-catalog-next"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_agnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ag"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_agricultureagriculturedatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "agriculture"
  type    = "CNAME"

  ttl     = 300
  records = ["agriculture.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_catalogd2friv3a0qqhqwcloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "catalog"
  type    = "CNAME"

  ttl     = 300
  records = ["d2friv3a0qqhqw.cloudfront.net"]

}


resource "aws_route53_record" "datagov_catalogbspnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "catalog-bsp"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_catalognextnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "catalog-next"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_cinspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ci"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_citiesnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "cities"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_climateclimatedatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "climate"
  type    = "CNAME"

  ttl     = 300
  records = ["climate.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_countiesnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "counties"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_dashboarddashboarddatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "dashboard"
  type    = "CNAME"

  ttl     = 300
  records = ["dashboard.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_dashboardbspnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "dashboard-bsp"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_dashboardlabsdashboardbspdatagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "dashboard-labs"
  type    = "CNAME"

  ttl     = 300
  records = ["dashboard-bsp.data.gov"]

}


resource "aws_route53_record" "datagov_developerdeveloperdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "developer"
  type    = "CNAME"

  ttl     = 300
  records = ["developer.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_ednspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ed"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_educationnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "education"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_energyenergydatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "energy"
  type    = "CNAME"

  ttl     = 300
  records = ["energy.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_ethicsnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ethics"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_federationd27ayqvgdtxgg3cloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "federation"
  type    = "CNAME"

  ttl     = 300
  records = ["d27ayqvgdtxgg3.cloudfront.net"]

}


resource "aws_route53_record" "datagov_federationstagingd30aqfbz27ewe7cloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "federation-staging"
  type    = "CNAME"

  ttl     = 300
  records = ["d30aqfbz27ewe7.cloudfront.net"]

}


resource "aws_route53_record" "datagov_filestorenspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "filestore"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_foodfooddatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "food"
  type    = "CNAME"

  ttl     = 300
  records = ["food.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_foodsecuritynspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "foodsecurity"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_geospatialnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "geospatial"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_healthnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "health"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_highlightshighlightsdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "highlights"
  type    = "CNAME"

  ttl     = 300
  records = ["highlights.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_inventoryinventorybspdatagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "inventory"
  type    = "CNAME"

  ttl     = 300
  records = ["inventory.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_labslabsdatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "labs"
  type    = "CNAME"

  ttl     = 300
  records = ["labs.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_labsbspnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "labs-bsp"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_noticenspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "notice"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_nutritionnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "nutrition"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_oceanoceandatagovexternaldomainsproductioncloudgov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ocean"
  type    = "CNAME"

  ttl     = 300
  records = ["ocean.data.gov.external-domains-production.cloud.gov"]

}


resource "aws_route53_record" "datagov_originsdatagovwwwdatalbgsaakadnsnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "origins-data-gov"
  type    = "CNAME"

  ttl     = 300
  records = ["wwwdata.lb.gsa.akadns.net"]

}


resource "aws_route53_record" "datagov_referencenspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "reference"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_resourcesd9v2xy0mx1ayqcloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "resources"
  type    = "CNAME"

  ttl     = 300
  records = ["d9v2xy0mx1ayq.cloudfront.net"]

}


resource "aws_route53_record" "datagov_resourcesstagingd13l8e1a7ekkcacloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "resources-staging"
  type    = "CNAME"

  ttl     = 300
  records = ["d13l8e1a7ekkca.cloudfront.net"]

}


resource "aws_route53_record" "datagov_ruralnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "rural"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_sbxnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "sbx"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_sdgd1z5ray7fqefkvcloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "sdg"
  type    = "CNAME"

  ttl     = 300
  records = ["d1z5ray7fqefkv.cloudfront.net"]

}


resource "aws_route53_record" "datagov_sdgstagingdhrxft6loyu0ncloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "sdg-staging"
  type    = "CNAME"

  ttl     = 300
  records = ["dhrxft6loyu0n.cloudfront.net"]

}


resource "aws_route53_record" "datagov_searchnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "search"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_semanticnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "semantic"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_servicesnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "services"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_sitesnextnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "sites-next"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_statesnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "states"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_staticbspnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "static-bsp"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_strategyd3mxkpq217356pcloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "strategy"
  type    = "CNAME"

  ttl     = 300
  records = ["d3mxkpq217356p.cloudfront.net"]

}


resource "aws_route53_record" "datagov_strategystagingd97qwv40ba5n0cloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "strategy-staging"
  type    = "CNAME"

  ttl     = 300
  records = ["d97qwv40ba5n0.cloudfront.net"]

}


resource "aws_route53_record" "datagov_wpbspnspocsitnethelixgsagov_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "wp-bsp"
  type    = "CNAME"

  ttl     = 300
  records = ["nsp-ocsit.net.helix.gsa.gov"]

}


resource "aws_route53_record" "datagov_wwwd36thseoamvwaacloudfrontnet_cname" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "www"
  type    = "CNAME"

  ttl     = 300
  records = ["wp-bsp.data.gov"]

}

resource "aws_route53_record" "datagov_api_ns" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "api"
  type    = "NS"

  ttl = 300
  records = [
    "ns-738.awsdns-28.net.",
    "ns-1612.awsdns-09.co.uk.",
    "ns-468.awsdns-58.com.",
    "ns-1281.awsdns-32.org."
  ]
}

resource "aws_route53_record" "datagov_ssb_ns" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ssb"
  type    = "NS"

  ttl = 300
  records = [
    "ns-658.awsdns-18.net.",
    "ns-146.awsdns-18.com.",
    "ns-1439.awsdns-51.org.",
    "ns-1688.awsdns-19.co.uk."
  ]
}

resource "aws_route53_record" "datagov_ssbdev_ns" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ssb-dev"
  type    = "NS"

  ttl = 300
  records = [
    "ns-1839.awsdns-37.co.uk.",
    "ns-1422.awsdns-49.org.",
    "ns-673.awsdns-20.net.",
    "ns-297.awsdns-37.com."
  ]
}

resource "aws_route53_record" "datagov_ssbstaging_ns" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "ssb-staging"
  type    = "NS"

  ttl = 300
  records = [
    "ns-1903.awsdns-45.co.uk.",
    "ns-510.awsdns-63.com.",
    "ns-890.awsdns-47.net.",
    "ns-1056.awsdns-04.org."
  ]
}

resource "aws_route53_record" "datagov__txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = ""
  type    = "TXT"

  ttl = 300
  records = [
    "621df521f1e44ac69a670f325dc86889",
    "v=spf1 ip4:34.193.244.109 include:gsa.gov ~all",
    "n6fgn8dyh1hhqsmghskdplss7zp7yt7q"
  ]
}

resource "aws_route53_record" "datagov_mloj922e44u1o54qmtbqbi4k6r_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "@"
  type    = "TXT"

  ttl     = 300
  records = ["mloj922e44u1o54qmtbqbi4k6r"]

}


resource "aws_route53_record" "datagov_acmechallengefederationDVhxe1yzatjC0zzy0f6tN87IACCK2eAz00YqyuzjA_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.federation"
  type    = "TXT"

  ttl     = 300
  records = ["DVhxe1y_zatjC0zzy-0f6tN87IACCK2eAz00YqyuzjA"]

}


resource "aws_route53_record" "datagov_acmechallengefederationstagingjBIuzGOGGA8ahB7kFxAWuAMCAxFoMMEn63xCVO0LAY_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.federation-staging"
  type    = "TXT"

  ttl     = 300
  records = ["jBIuzGOGGA8ahB7kFxAWuAMCAxFoMMEn63xC_VO0LAY"]

}


resource "aws_route53_record" "datagov_acmechallengeresourcesW9OAmioR3ViZvIRze2pvvmDgNtVaYqcP2Cft0lgcU_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.resources"
  type    = "TXT"

  ttl     = 300
  records = ["W9OAmi-oR3ViZvIRze2pvvmDgNtVaYqcP2Cft_0lgcU"]

}


resource "aws_route53_record" "datagov_acmechallengeresourcesstagingCTRQ5trgMF0KKgUZk14YJSRlGD36BWeQENmK8XAWk8_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.resources-staging"
  type    = "TXT"

  ttl     = 300
  records = ["CTR-Q5trgMF0KKgUZk14YJSRlGD36BWeQENmK8XAWk8"]

}


resource "aws_route53_record" "datagov_acmechallengesdg1cEge5zwHmYap2xfUTEKrx6YWJuN28yJrJAyQMysXc_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.sdg"
  type    = "TXT"

  ttl     = 300
  records = ["1cEge-5zwHmYap2xfUTEKrx6YWJuN28yJrJAyQMysXc"]

}


resource "aws_route53_record" "datagov_acmechallengesdgstagingbNsofNEUeS3uTsLwl9lXkt5OYOVzcE4WXv7LKQGCLQ_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.sdg-staging"
  type    = "TXT"

  ttl     = 300
  records = ["bNsofNEU-eS3uTsLwl9lXkt5OYOVzcE4WXv7LKQGCLQ"]

}


resource "aws_route53_record" "datagov_acmechallengestrategyHjy5O04QmUqj4qgVY4jRisqf9oMl3G3z0pRo4Irlcg_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.strategy"
  type    = "TXT"

  ttl     = 300
  records = ["H_jy5O04QmUqj4qgVY4jRisqf9oMl3G3z0pRo4Irlcg"]

}


resource "aws_route53_record" "datagov_acmechallengestrategystagingh6eondVFdMUnFzj4flKL1jDbO2DL1pVFHdoo1J43k_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_acme-challenge.strategy-staging"
  type    = "TXT"

  ttl     = 300
  records = ["h6eondV-FdM_UnFzj4flKL1jDbO2DL1pVFHdoo1J43k"]

}


resource "aws_route53_record" "datagov_dmarcvDMARC1prejectfo1pct100ri86400ruamailtogsaloginruaagaricommailtodmarcreportsgsagovmailtoreportsdmarccyberdhsgovrufmailtogsaloginrufagaricommailtodmarcfailuresgsagov_txt" {
  zone_id = aws_route53_zone.datagov_zone.zone_id
  name    = "_dmarc"
  type    = "TXT"

  ttl     = 300
  records = ["v=DMARC1; p=reject; fo=1; pct=100; ri=86400; rua=mailto:gsalogin@rua.agari.com,mailto:dmarcreports@gsa.gov,mailto:reports@dmarc.cyber.dhs.gov; ruf=mailto:gsalogin@ruf.agari.com,mailto:dmarcfailures@gsa.gov"]

}

