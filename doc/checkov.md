CKV2_AWS_61: "Ensure that an S3 bucket has a lifecycle configuration"

```
Check: CKV2_AWS_61: "Ensure that an S3 bucket has a lifecycle configuration"
	FAILED for resource: aws_s3_bucket.backend
	File: /bootstrap/init.tf:6-12

		6  | resource "aws_s3_bucket" "backend" {
		7  |   bucket = "tts-dns-terraform-state"
		8  | 
		9  |   versioning {
		10 |     enabled = true
		11 |   }
		12 | }

```

CKV_AWS_273: "Ensure access is controlled through SSO and not AWS IAM defined users"

```
Check: CKV_AWS_273: "Ensure access is controlled through SSO and not AWS IAM defined users"
	FAILED for resource: aws_iam_user.deployer
	File: /bootstrap/init.tf:15-17

		15 | resource "aws_iam_user" "deployer" {
		16 |   name = "circleci-deployer"
		17 | }
```

CKV_AWS_289: "Ensure IAM policies does not allow permissions management / resource exposure without constraints"

```
Check: CKV_AWS_289: "Ensure IAM policies does not allow permissions management / resource exposure without constraints"
	FAILED for resource: aws_iam_user_policy.circleci_deployer_policy
	File: /bootstrap/init.tf:19-67

		19 | resource "aws_iam_user_policy" "circleci_deployer_policy" {
		20 |   name = "route53-deployment"
		21 |   user = "${aws_iam_user.deployer.name}"
		22 | 
		23 |   policy = <<EOF
		24 | {
		25 |   "Version": "2012-10-17",
		26 |   "Statement": [
		27 |     {
		28 |       "Action": [
		29 |         "route53:*"
		30 |       ],
		31 |       "Effect": "Allow",
		32 |       "Resource": "*"
		33 |     },
		34 |     {
		35 |       "Action": [
		36 |         "kms:CreateAlias",
		37 |         "kms:CreateGrant",
		38 |         "kms:CreateKey",
		39 |         "kms:DeleteAlias",
		40 |         "kms:DescribeKey",
		41 |         "kms:GetKeyPolicy",
		42 |         "kms:GetKeyRotationStatus",
		43 |         "kms:ListAliases",
		44 |         "kms:ListResourceTags",
		45 |         "kms:ScheduleKeyDeletion"
		46 |       ],
		47 |       "Effect": "Allow",
		48 |       "Resource": "*"
		49 |     },
		50 |     {
		51 |       "Effect": "Allow",
		52 |       "Action": ["s3:ListBucket"],
		53 |       "Resource": ["${aws_s3_bucket.backend.arn}"]
		54 |     },
		55 |     {
		56 |       "Effect": "Allow",
		57 |       "Action": [
		58 |         "s3:PutObject",
		59 |         "s3:GetObject",
		60 |         "s3:DeleteObject"
		61 |       ],
		62 |       "Resource": ["${aws_s3_bucket.backend.arn}/*"]
		63 |     }
		64 |   ]
		65 | }
		66 | EOF
		67 | }
```
CKV_AWS_40: "Ensure IAM policies are attached only to groups or roles (Reducing access management complexity may in-turn reduce opportunity for a principal to inadvertently receive or retain excessive privileges.)

```

Check: CKV_AWS_40: "Ensure IAM policies are attached only to groups or roles (Reducing access management complexity may in-turn reduce opportunity for a principal to inadvertently receive or retain excessive privileges.)"
	FAILED for resource: aws_iam_user_policy.circleci_deployer_policy
	File: /bootstrap/init.tf:19-67
	Guide: https://docs.bridgecrew.io/docs/iam_16-iam-policy-privileges-1

		19 | resource "aws_iam_user_policy" "circleci_deployer_policy" {
		20 |   name = "route53-deployment"
		21 |   user = "${aws_iam_user.deployer.name}"
		22 | 
		23 |   policy = <<EOF
		24 | {
		25 |   "Version": "2012-10-17",
		26 |   "Statement": [
		27 |     {
		28 |       "Action": [
		29 |         "route53:*"
		30 |       ],
		31 |       "Effect": "Allow",
		32 |       "Resource": "*"
		33 |     },
		34 |     {
		35 |       "Action": [
		36 |         "kms:CreateAlias",
		37 |         "kms:CreateGrant",
		38 |         "kms:CreateKey",
		39 |         "kms:DeleteAlias",
		40 |         "kms:DescribeKey",
		41 |         "kms:GetKeyPolicy",
		42 |         "kms:GetKeyRotationStatus",
		43 |         "kms:ListAliases",
		44 |         "kms:ListResourceTags",
		45 |         "kms:ScheduleKeyDeletion"
		46 |       ],
		47 |       "Effect": "Allow",
		48 |       "Resource": "*"
		49 |     },
		50 |     {
		51 |       "Effect": "Allow",
		52 |       "Action": ["s3:ListBucket"],
		53 |       "Resource": ["${aws_s3_bucket.backend.arn}"]
		54 |     },
		55 |     {
		56 |       "Effect": "Allow",
		57 |       "Action": [
		58 |         "s3:PutObject",
		59 |         "s3:GetObject",
		60 |         "s3:DeleteObject"
		61 |       ],
		62 |       "Resource": ["${aws_s3_bucket.backend.arn}/*"]
		63 |     }
		64 |   ]
		65 | }
		66 | EOF
		67 | }

```

CKV_AWS_355: "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"

```
Check: CKV_AWS_355: "Ensure no IAM policies documents allow "*" as a statement's resource for restrictable actions"
	FAILED for resource: aws_iam_user_policy.circleci_deployer_policy
	File: /bootstrap/init.tf:19-67

		19 | resource "aws_iam_user_policy" "circleci_deployer_policy" {
		20 |   name = "route53-deployment"
		21 |   user = "${aws_iam_user.deployer.name}"
		22 | 
		23 |   policy = <<EOF
		24 | {
		25 |   "Version": "2012-10-17",
		26 |   "Statement": [
		27 |     {
		28 |       "Action": [
		29 |         "route53:*"
		30 |       ],
		31 |       "Effect": "Allow",
		32 |       "Resource": "*"
		33 |     },
		34 |     {
		35 |       "Action": [
		36 |         "kms:CreateAlias",
		37 |         "kms:CreateGrant",
		38 |         "kms:CreateKey",
		39 |         "kms:DeleteAlias",
		40 |         "kms:DescribeKey",
		41 |         "kms:GetKeyPolicy",
		42 |         "kms:GetKeyRotationStatus",
		43 |         "kms:ListAliases",
		44 |         "kms:ListResourceTags",
		45 |         "kms:ScheduleKeyDeletion"
		46 |       ],
		47 |       "Effect": "Allow",
		48 |       "Resource": "*"
		49 |     },
		50 |     {
		51 |       "Effect": "Allow",
		52 |       "Action": ["s3:ListBucket"],
		53 |       "Resource": ["${aws_s3_bucket.backend.arn}"]
		54 |     },
		55 |     {
		56 |       "Effect": "Allow",
		57 |       "Action": [
		58 |         "s3:PutObject",
		59 |         "s3:GetObject",
		60 |         "s3:DeleteObject"
		61 |       ],
		62 |       "Resource": ["${aws_s3_bucket.backend.arn}/*"]
		63 |     }
		64 |   ]
		65 | }
		66 | EOF
		67 | }

```

CKV_AWS_290: "Ensure IAM policies does not allow write access without constraints"

```
Check: CKV_AWS_290: "Ensure IAM policies does not allow write access without constraints"
	FAILED for resource: aws_iam_user_policy.circleci_deployer_policy
	File: /bootstrap/init.tf:19-67

		19 | resource "aws_iam_user_policy" "circleci_deployer_policy" {
		20 |   name = "route53-deployment"
		21 |   user = "${aws_iam_user.deployer.name}"
		22 | 
		23 |   policy = <<EOF
		24 | {
		25 |   "Version": "2012-10-17",
		26 |   "Statement": [
		27 |     {
		28 |       "Action": [
		29 |         "route53:*"
		30 |       ],
		31 |       "Effect": "Allow",
		32 |       "Resource": "*"
		33 |     },
		34 |     {
		35 |       "Action": [
		36 |         "kms:CreateAlias",
		37 |         "kms:CreateGrant",
		38 |         "kms:CreateKey",
		39 |         "kms:DeleteAlias",
		40 |         "kms:DescribeKey",
		41 |         "kms:GetKeyPolicy",
		42 |         "kms:GetKeyRotationStatus",
		43 |         "kms:ListAliases",
		44 |         "kms:ListResourceTags",
		45 |         "kms:ScheduleKeyDeletion"
		46 |       ],
		47 |       "Effect": "Allow",
		48 |       "Resource": "*"
		49 |     },
		50 |     {
		51 |       "Effect": "Allow",
		52 |       "Action": ["s3:ListBucket"],
		53 |       "Resource": ["${aws_s3_bucket.backend.arn}"]
		54 |     },
		55 |     {
		56 |       "Effect": "Allow",
		57 |       "Action": [
		58 |         "s3:PutObject",
		59 |         "s3:GetObject",
		60 |         "s3:DeleteObject"
		61 |       ],
		62 |       "Resource": ["${aws_s3_bucket.backend.arn}/*"]
		63 |     }
		64 |   ]
		65 | }
		66 | EOF
		67 | }
```

CKV_AWS_33: "Ensure KMS key policy does not contain wildcard (*) principal"

```
Check: CKV_AWS_33: "Ensure KMS key policy does not contain wildcard (*) principal"
	FAILED for resource: aws_kms_key.datagov_zone
	File: /data.gov.tf:10-58
	Guide: https://docs.bridgecrew.io/docs/ensure-kms-key-policy-does-not-contain-wildcard-principal

		10 | resource "aws_kms_key" "datagov_zone" {
		11 | 
		12 |   # See Route53 key requirements here: 
		13 |   # https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-configuring-dnssec-cmk-requirements.html
		14 |   customer_master_key_spec = "ECC_NIST_P256"
		15 |   deletion_window_in_days  = 7
		16 |   key_usage                = "SIGN_VERIFY"
		17 |   policy = jsonencode({
		18 |     Statement = [
		19 |       {
		20 |         Action = [
		21 |           "kms:DescribeKey",
		22 |           "kms:GetPublicKey",
		23 |           "kms:Sign",
		24 |         ],
		25 |         Effect = "Allow"
		26 |         Principal = {
		27 |           Service = "dnssec-route53.amazonaws.com"
		28 |         }
		29 |         Sid      = "Allow Route 53 DNSSEC Service",
		30 |         Resource = "*"
		31 |       },
		32 |       {
		33 |         Action = "kms:CreateGrant",
		34 |         Effect = "Allow"
		35 |         Principal = {
		36 |           Service = "dnssec-route53.amazonaws.com"
		37 |         }
		38 |         Sid      = "Allow Route 53 DNSSEC Service to CreateGrant",
		39 |         Resource = "*"
		40 |         Condition = {
		41 |           Bool = {
		42 |             "kms:GrantIsForAWSResource" = "true"
		43 |           }
		44 |         }
		45 |       },
		46 |       {
		47 |         Action = "kms:*"
		48 |         Effect = "Allow"
		49 |         Principal = {
		50 |           AWS = "*"
		51 |         }
		52 |         Resource = "*"
		53 |         Sid      = "IAM User Permissions"
		54 |       },
		55 |     ]
		56 |     Version = "2012-10-17"
		57 |   })
		58 | }
```

CKV2_AWS_23: "Route53 A Record has Attached Resource"

```
Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_18f_gov_a
	File: /18f.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "d_18f_gov_18f_gov_a" {
		10 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		11 |   name    = "18f.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d1undivnru8ry9.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_accessibility_18f_gov_a
	File: /18f.gov.tf:84-94
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		84 | resource "aws_route53_record" "d_18f_gov_accessibility_18f_gov_a" {
		85 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		86 |   name    = "accessibility.18f.gov."
		87 |   type    = "A"
		88 | 
		89 |   alias {
		90 |     name                   = "d3gg23ftaba0j8.cloudfront.net."
		91 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		92 |     evaluate_target_health = false
		93 |   }
		94 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_ads_18f_gov_a
	File: /18f.gov.tf:108-118
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		108 | resource "aws_route53_record" "d_18f_gov_ads_18f_gov_a" {
		109 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		110 |   name    = "ads.18f.gov."
		111 |   type    = "A"
		112 | 
		113 |   alias {
		114 |     name                   = "d22116wmhcds2y.cloudfront.net."
		115 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		116 |     evaluate_target_health = false
		117 |   }
		118 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_agile_18f_gov_a
	File: /18f.gov.tf:140-150
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		140 | resource "aws_route53_record" "d_18f_gov_agile_18f_gov_a" {
		141 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		142 |   name    = "agile.18f.gov."
		143 |   type    = "A"
		144 | 
		145 |   alias {
		146 |     name                   = "d2zsago6kfzgka.cloudfront.net."
		147 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		148 |     evaluate_target_health = false
		149 |   }
		150 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_acqstack-journeymap_18f_gov_a
	File: /18f.gov.tf:188-198
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		188 | resource "aws_route53_record" "d_18f_gov_acqstack-journeymap_18f_gov_a" {
		189 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		190 |   name    = "acqstack-journeymap.18f.gov."
		191 |   type    = "A"
		192 | 
		193 |   alias {
		194 |     name                   = "douocfsg4z7b4.cloudfront.net."
		195 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		196 |     evaluate_target_health = false
		197 |   }
		198 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_api-all-the-x_18f_gov_a
	File: /18f.gov.tf:220-230
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		220 | resource "aws_route53_record" "d_18f_gov_api-all-the-x_18f_gov_a" {
		221 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		222 |   name    = "api-all-the-x.18f.gov."
		223 |   type    = "A"
		224 | 
		225 |   alias {
		226 |     name                   = "d2y8d8116udf0m.cloudfront.net."
		227 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		228 |     evaluate_target_health = false
		229 |   }
		230 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_api-program_18f_gov_a
	File: /18f.gov.tf:244-254
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		244 | resource "aws_route53_record" "d_18f_gov_api-program_18f_gov_a" {
		245 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		246 |   name    = "api-program.18f.gov."
		247 |   type    = "A"
		248 | 
		249 |   alias {
		250 |     name                   = "d1evjsspb8gisi.cloudfront.net."
		251 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		252 |     evaluate_target_health = false
		253 |   }
		254 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_api-usability-testing_18f_gov_a
	File: /18f.gov.tf:268-278
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		268 | resource "aws_route53_record" "d_18f_gov_api-usability-testing_18f_gov_a" {
		269 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		270 |   name    = "api-usability-testing.18f.gov."
		271 |   type    = "A"
		272 | 
		273 |   alias {
		274 |     name                   = "d1lsalt1zbpjfm.cloudfront.net."
		275 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		276 |     evaluate_target_health = false
		277 |   }
		278 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_atul-docker-presentation_18f_gov_a
	File: /18f.gov.tf:316-326
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		316 | resource "aws_route53_record" "d_18f_gov_atul-docker-presentation_18f_gov_a" {
		317 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		318 |   name    = "atul-docker-presentation.18f.gov."
		319 |   type    = "A"
		320 | 
		321 |   alias {
		322 |     name                   = "dndsei0n82g4z.cloudfront.net."
		323 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		324 |     evaluate_target_health = false
		325 |   }
		326 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_automated-testing-playbook_18f_gov_a
	File: /18f.gov.tf:336-346
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		336 | resource "aws_route53_record" "d_18f_gov_automated-testing-playbook_18f_gov_a" {
		337 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		338 |   name    = "automated-testing-playbook.18f.gov."
		339 |   type    = "A"
		340 | 
		341 |   alias {
		342 |     name                   = "dieiwe9bk9l6.cloudfront.net."
		343 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		344 |     evaluate_target_health = false
		345 |   }
		346 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_blogging-guide_18f_gov_cname
	File: /18f.gov.tf:360-370
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		360 | resource "aws_route53_record" "d_18f_gov_blogging-guide_18f_gov_cname" {
		361 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		362 |   name    = "blogging-guide.18f.gov."
		363 |   type    = "A"
		364 | 
		365 |   alias {
		366 |     name                   = "d12gmeaikmi2zi.cloudfront.net."
		367 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		368 |     evaluate_target_health = false
		369 |   }
		370 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_before-you-ship_18f_gov_a
	File: /18f.gov.tf:384-394
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		384 | resource "aws_route53_record" "d_18f_gov_before-you-ship_18f_gov_a" {
		385 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		386 |   name    = "before-you-ship.18f.gov."
		387 |   type    = "A"
		388 | 
		389 |   alias {
		390 |     name                   = "daap61vtgsw76.cloudfront.net."
		391 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		392 |     evaluate_target_health = false
		393 |   }
		394 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_boise_18f_gov_a
	File: /18f.gov.tf:408-418
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		408 | resource "aws_route53_record" "d_18f_gov_boise_18f_gov_a" {
		409 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		410 |   name    = "boise.18f.gov."
		411 |   type    = "A"
		412 | 
		413 |   alias {
		414 |     name                   = "d2swak4c9i5bze.cloudfront.net."
		415 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		416 |     evaluate_target_health = false
		417 |   }
		418 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_brand_18f_gov_a
	File: /18f.gov.tf:440-450
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		440 | resource "aws_route53_record" "d_18f_gov_brand_18f_gov_a" {
		441 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		442 |   name    = "brand.18f.gov."
		443 |   type    = "A"
		444 | 
		445 |   alias {
		446 |     name                   = "d19y688vepyspr.cloudfront.net."
		447 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		448 |     evaluate_target_health = false
		449 |   }
		450 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_content-guide_18f_gov_a
	File: /18f.gov.tf:504-514
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		504 | resource "aws_route53_record" "d_18f_gov_content-guide_18f_gov_a" {
		505 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		506 |   name    = "content-guide.18f.gov."
		507 |   type    = "A"
		508 | 
		509 |   alias {
		510 |     name                   = "dv941ubd2f1ex.cloudfront.net."
		511 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		512 |     evaluate_target_health = false
		513 |   }
		514 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_contracting-cookbook_18f_gov_a
	File: /18f.gov.tf:528-538
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		528 | resource "aws_route53_record" "d_18f_gov_contracting-cookbook_18f_gov_a" {
		529 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		530 |   name    = "contracting-cookbook.18f.gov."
		531 |   type    = "A"
		532 | 
		533 |   alias {
		534 |     name                   = "d20pvyni7jlo89.cloudfront.net."
		535 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		536 |     evaluate_target_health = false
		537 |   }
		538 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_design-principles-guide_18f_gov_a
	File: /18f.gov.tf:560-570
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		560 | resource "aws_route53_record" "d_18f_gov_design-principles-guide_18f_gov_a" {
		561 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		562 |   name    = "design-principles-guide.18f.gov."
		563 |   type    = "A"
		564 | 
		565 |   alias {
		566 |     name                   = "d3g58t13quzfbr.cloudfront.net."
		567 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		568 |     evaluate_target_health = false
		569 |   }
		570 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_digital-acquisition-playbook_18f_gov_a
	File: /18f.gov.tf:584-594
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		584 | resource "aws_route53_record" "d_18f_gov_digital-acquisition-playbook_18f_gov_a" {
		585 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		586 |   name    = "digital-acquisition-playbook.18f.gov."
		587 |   type    = "A"
		588 | 
		589 |   alias {
		590 |     name                   = "d3f32ju5qz0fej.cloudfront.net."
		591 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		592 |     evaluate_target_health = false
		593 |   }
		594 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_digitalaccelerator_18f_gov_a
	File: /18f.gov.tf:608-618
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		608 | resource "aws_route53_record" "d_18f_gov_digitalaccelerator_18f_gov_a" {
		609 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		610 |   name    = "digitalaccelerator.18f.gov."
		611 |   type    = "A"
		612 | 
		613 |   alias {
		614 |     name                   = "dmsaspwnb8oe8.cloudfront.net."
		615 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		616 |     evaluate_target_health = false
		617 |   }
		618 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_eng-hiring_18f_gov_a
	File: /18f.gov.tf:632-642
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		632 | resource "aws_route53_record" "d_18f_gov_eng-hiring_18f_gov_a" {
		633 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		634 |   name    = "eng-hiring.18f.gov."
		635 |   type    = "A"
		636 | 
		637 |   alias {
		638 |     name                   = "d1ju28lhpbkq84.cloudfront.net."
		639 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		640 |     evaluate_target_health = false
		641 |   }
		642 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_files_18f_gov_a
	File: /18f.gov.tf:688-698
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		688 | resource "aws_route53_record" "d_18f_gov_files_18f_gov_a" {
		689 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		690 |   name    = "files.18f.gov."
		691 |   type    = "A"
		692 | 
		693 |   alias {
		694 |     name                   = "d3gawctq7ecsbu.cloudfront.net."
		695 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		696 |     evaluate_target_health = false
		697 |   }
		698 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_fugacious_18f_gov_a
	File: /18f.gov.tf:700-710
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		700 | resource "aws_route53_record" "d_18f_gov_fugacious_18f_gov_a" {
		701 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		702 |   name    = "fugacious.18f.gov."
		703 |   type    = "A"
		704 | 
		705 |   alias {
		706 |     name                   = "d309sw0ah4sgku.cloudfront.net."
		707 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		708 |     evaluate_target_health = false
		709 |   }
		710 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_grouplet-playbook_18f_gov_a
	File: /18f.gov.tf:738-748
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		738 | resource "aws_route53_record" "d_18f_gov_grouplet-playbook_18f_gov_a" {
		739 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		740 |   name    = "grouplet-playbook.18f.gov."
		741 |   type    = "A"
		742 | 
		743 |   alias {
		744 |     name                   = "duek7xmosg5g1.cloudfront.net."
		745 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		746 |     evaluate_target_health = false
		747 |   }
		748 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_guides_18f_gov_a
	File: /18f.gov.tf:762-772
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		762 | resource "aws_route53_record" "d_18f_gov_guides_18f_gov_a" {
		763 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		764 |   name    = "guides.18f.gov."
		765 |   type    = "A"
		766 | 
		767 |   alias {
		768 |     name                   = "d10jxiv8e4xcp7.cloudfront.net."
		769 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		770 |     evaluate_target_health = false
		771 |   }
		772 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_guides-template_18f_gov_a
	File: /18f.gov.tf:786-796
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		786 | resource "aws_route53_record" "d_18f_gov_guides-template_18f_gov_a" {
		787 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		788 |   name    = "guides-template.18f.gov."
		789 |   type    = "A"
		790 | 
		791 |   alias {
		792 |     name                   = "d2qsfvvx1xjk0n.cloudfront.net."
		793 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		794 |     evaluate_target_health = false
		795 |   }
		796 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_iaa-forms_18f_gov_a
	File: /18f.gov.tf:810-820
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		810 | resource "aws_route53_record" "d_18f_gov_iaa-forms_18f_gov_a" {
		811 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		812 |   name    = "iaa-forms.18f.gov."
		813 |   type    = "A"
		814 | 
		815 |   alias {
		816 |     name                   = "d25t6p0vmr5bdy.cloudfront.net."
		817 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		818 |     evaluate_target_health = false
		819 |   }
		820 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_innovation-toolkit-prototype_18f_gov_a
	File: /18f.gov.tf:834-844
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		834 | resource "aws_route53_record" "d_18f_gov_innovation-toolkit-prototype_18f_gov_a" {
		835 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		836 |   name    = "innovation-toolkit-prototype.18f.gov."
		837 |   type    = "A"
		838 | 
		839 |   alias {
		840 |     name                   = "d1n516riijd335.cloudfront.net."
		841 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		842 |     evaluate_target_health = false
		843 |   }
		844 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_lean-product-design_18f_gov_a
	File: /18f.gov.tf:869-879
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		869 | resource "aws_route53_record" "d_18f_gov_lean-product-design_18f_gov_a" {
		870 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		871 |   name    = "lean-product-design.18f.gov."
		872 |   type    = "A"
		873 | 
		874 |   alias {
		875 |     name                   = "d3am6kz2e8wzjv.cloudfront.net."
		876 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		877 |     evaluate_target_health = false
		878 |   }
		879 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_methods_18f_gov_a
	File: /18f.gov.tf:893-903
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		893 | resource "aws_route53_record" "d_18f_gov_methods_18f_gov_a" {
		894 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		895 |   name    = "methods.18f.gov."
		896 |   type    = "A"
		897 | 
		898 |   alias {
		899 |     name                   = "d2z1u02mjhp26x.cloudfront.net."
		900 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		901 |     evaluate_target_health = false
		902 |   }
		903 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_micropurchase_18f_gov_a
	File: /18f.gov.tf:918-928
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		918 | resource "aws_route53_record" "d_18f_gov_micropurchase_18f_gov_a" {
		919 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		920 |   name    = "micropurchase.18f.gov."
		921 |   type    = "A"
		922 | 
		923 |   alias {
		924 |     name                   = "dh692qtc0b17x.cloudfront.net."
		925 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		926 |     evaluate_target_health = false
		927 |   }
		928 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_open-source-guide_18f_gov_a
	File: /18f.gov.tf:950-960
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		950 | resource "aws_route53_record" "d_18f_gov_open-source-guide_18f_gov_a" {
		951 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		952 |   name    = "open-source-guide.18f.gov."
		953 |   type    = "A"
		954 | 
		955 |   alias {
		956 |     name                   = "d1lphbkymflb0f.cloudfront.net."
		957 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		958 |     evaluate_target_health = false
		959 |   }
		960 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_open-source-program_18f_gov_a
	File: /18f.gov.tf:974-984
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		974 | resource "aws_route53_record" "d_18f_gov_open-source-program_18f_gov_a" {
		975 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		976 |   name    = "open-source-program.18f.gov."
		977 |   type    = "A"
		978 | 
		979 |   alias {
		980 |     name                   = "d3nhr6mr0xvquu.cloudfront.net."
		981 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		982 |     evaluate_target_health = false
		983 |   }
		984 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_paid-leave-prototype_18f_gov_a
	File: /18f.gov.tf:1006-1016
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1006 | resource "aws_route53_record" "d_18f_gov_paid-leave-prototype_18f_gov_a" {
		1007 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1008 |   name    = "paid-leave-prototype.18f.gov."
		1009 |   type    = "A"
		1010 | 
		1011 |   alias {
		1012 |     name                   = "d3p6d6b3zaatqv.cloudfront.net."
		1013 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1014 |     evaluate_target_health = false
		1015 |   }
		1016 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_partnership-playbook_18f_gov_a
	File: /18f.gov.tf:1038-1048
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1038 | resource "aws_route53_record" "d_18f_gov_partnership-playbook_18f_gov_a" {
		1039 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1040 |   name    = "partnership-playbook.18f.gov."
		1041 |   type    = "A"
		1042 | 
		1043 |   alias {
		1044 |     name                   = "d19eih1husc7rz.cloudfront.net."
		1045 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1046 |     evaluate_target_health = false
		1047 |   }
		1048 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_plain-language-tutorial_18f_gov_a
	File: /18f.gov.tf:1062-1072
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1062 | resource "aws_route53_record" "d_18f_gov_plain-language-tutorial_18f_gov_a" {
		1063 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1064 |   name    = "plain-language-tutorial.18f.gov."
		1065 |   type    = "A"
		1066 | 
		1067 |   alias {
		1068 |     name                   = "d1cr44lbvuvjia.cloudfront.net."
		1069 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1070 |     evaluate_target_health = false
		1071 |   }
		1072 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_product-guide_18f_gov_a
	File: /18f.gov.tf:1102-1112
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1102 | resource "aws_route53_record" "d_18f_gov_product-guide_18f_gov_a" {
		1103 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1104 |   name    = "product-guide.18f.gov."
		1105 |   type    = "A"
		1106 | 
		1107 |   alias {
		1108 |     name                   = "d2ys0ic6txy8sy.cloudfront.net."
		1109 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1110 |     evaluate_target_health = false
		1111 |   }
		1112 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_testing-cookbook_18f_gov_a
	File: /18f.gov.tf:1134-1144
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1134 | resource "aws_route53_record" "d_18f_gov_testing-cookbook_18f_gov_a" {
		1135 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1136 |   name    = "testing-cookbook.18f.gov."
		1137 |   type    = "A"
		1138 | 
		1139 |   alias {
		1140 |     name                   = "d3r30wgm96hxdb.cloudfront.net."
		1141 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1142 |     evaluate_target_health = false
		1143 |   }
		1144 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_writing-lab-guide_18f_gov_a
	File: /18f.gov.tf:1166-1176
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1166 | resource "aws_route53_record" "d_18f_gov_writing-lab-guide_18f_gov_a" {
		1167 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1168 |   name    = "writing-lab-guide.18f.gov."
		1169 |   type    = "A"
		1170 | 
		1171 |   alias {
		1172 |     name                   = "d1pjk83agbp9qr.cloudfront.net."
		1173 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1174 |     evaluate_target_health = false
		1175 |   }
		1176 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_www_18f_gov_a
	File: /18f.gov.tf:1190-1200
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1190 | resource "aws_route53_record" "d_18f_gov_www_18f_gov_a" {
		1191 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1192 |   name    = "www.18f.gov."
		1193 |   type    = "A"
		1194 | 
		1195 |   alias {
		1196 |     name                   = "d1undivnru8ry9.cloudfront.net."
		1197 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1198 |     evaluate_target_health = false
		1199 |   }
		1200 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_agile-bpa_18f_gov_a
	File: /18f.gov.tf:1238-1248
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1238 | resource "aws_route53_record" "d_18f_gov_agile-bpa_18f_gov_a" {
		1239 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1240 |   name    = "agile-bpa.18f.gov."
		1241 |   type    = "A"
		1242 | 
		1243 |   alias {
		1244 |     name                   = "d2f0yvhrnh42o8.cloudfront.net."
		1245 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1246 |     evaluate_target_health = false
		1247 |   }
		1248 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_fedspendingtransparency_18f_gov_a
	File: /18f.gov.tf:1270-1280
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1270 | resource "aws_route53_record" "d_18f_gov_fedspendingtransparency_18f_gov_a" {
		1271 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1272 |   name    = "fedspendingtransparency.18f.gov."
		1273 |   type    = "A"
		1274 | 
		1275 |   alias {
		1276 |     name                   = "d3fi39fc24yqlx.cloudfront.net."
		1277 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1278 |     evaluate_target_health = false
		1279 |   }
		1280 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_slides_18f_gov_a
	File: /18f.gov.tf:1302-1312
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1302 | resource "aws_route53_record" "d_18f_gov_slides_18f_gov_a" {
		1303 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1304 |   name    = "slides.18f.gov."
		1305 |   type    = "A"
		1306 | 
		1307 |   alias {
		1308 |     name                   = "d1g4r1oppplum4.cloudfront.net."
		1309 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1310 |     evaluate_target_health = false
		1311 |   }
		1312 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_engineering_18f_gov_a
	File: /18f.gov.tf:1358-1368
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1358 | resource "aws_route53_record" "d_18f_gov_engineering_18f_gov_a" {
		1359 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1360 |   name    = "engineering.18f.gov."
		1361 |   type    = "A"
		1362 | 
		1363 |   alias {
		1364 |     name                   = "d1ah19wbgikahf.cloudfront.net."
		1365 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1366 |     evaluate_target_health = false
		1367 |   }
		1368 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_handbook_18f_gov_a
	File: /18f.gov.tf:1390-1400
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1390 | resource "aws_route53_record" "d_18f_gov_handbook_18f_gov_a" {
		1391 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1392 |   name    = "handbook.18f.gov."
		1393 |   type    = "A"
		1394 | 
		1395 |   alias {
		1396 |     name                   = "d36dwgrf0cle4t.cloudfront.net."
		1397 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1398 |     evaluate_target_health = false
		1399 |   }
		1400 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_wwwhandbook_18f_gov_a
	File: /18f.gov.tf:1422-1432
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1422 | resource "aws_route53_record" "d_18f_gov_wwwhandbook_18f_gov_a" {
		1423 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1424 |   name    = "wwwhandbook.18f.gov."
		1425 |   type    = "A"
		1426 | 
		1427 |   alias {
		1428 |     name                   = "d36dwgrf0cle4t.cloudfront.net."
		1429 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1430 |     evaluate_target_health = false
		1431 |   }
		1432 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_sites-staging_federalist_18f_gov_a
	File: /18f.gov.tf:1454-1464
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1454 | resource "aws_route53_record" "d_18f_gov_sites-staging_federalist_18f_gov_a" {
		1455 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1456 |   name    = "*.sites-staging.federalist.18f.gov."
		1457 |   type    = "A"
		1458 | 
		1459 |   alias {
		1460 |     name                   = "d2826r6t5bqji9.cloudfront.net."
		1461 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1462 |     evaluate_target_health = false
		1463 |   }
		1464 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_frontend_18f_gov_a
	File: /18f.gov.tf:1478-1488
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1478 | resource "aws_route53_record" "d_18f_gov_frontend_18f_gov_a" {
		1479 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1480 |   name    = "frontend.18f.gov."
		1481 |   type    = "A"
		1482 | 
		1483 |   alias {
		1484 |     name                   = "degmwhx2dki4o.cloudfront.net."
		1485 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1486 |     evaluate_target_health = false
		1487 |   }
		1488 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_demo-er2epz2vb_18f_gov_a
	File: /18f.gov.tf:1510-1520
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1510 | resource "aws_route53_record" "d_18f_gov_demo-er2epz2vb_18f_gov_a" {
		1511 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1512 |   name    = "demo-er2epz2vb.18f.gov."
		1513 |   type    = "A"
		1514 | 
		1515 |   alias {
		1516 |     name                   = "djut57wuzit2q.cloudfront.net."
		1517 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1518 |     evaluate_target_health = false
		1519 |   }
		1520 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_federalist-proxysite-test_18f_gov_a
	File: /18f.gov.tf:1542-1552
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1542 | resource "aws_route53_record" "d_18f_gov_federalist-proxysite-test_18f_gov_a" {
		1543 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1544 |   name    = "federalist-proxysite-test.18f.gov."
		1545 |   type    = "A"
		1546 | 
		1547 |   alias {
		1548 |     name                   = "d1p5ay1q619hg3.cloudfront.net."
		1549 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1550 |     evaluate_target_health = false
		1551 |   }
		1552 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.d_18f_gov_ux-guide_18f_gov_a
	File: /18f.gov.tf:1562-1572
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		1562 | resource "aws_route53_record" "d_18f_gov_ux-guide_18f_gov_a" {
		1563 |   zone_id = aws_route53_zone.d_18f_gov_zone.zone_id
		1564 |   name    = "ux-guide.18f.gov."
		1565 |   type    = "A"
		1566 | 
		1567 |   alias {
		1568 |     name                   = "d2mhwjcivqpysk.cloudfront.net."
		1569 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		1570 |     evaluate_target_health = false
		1571 |   }
		1572 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.analytics_usa_gov_analytics_usa_gov_a
	File: /analytics.usa.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "analytics_usa_gov_analytics_usa_gov_a" {
		10 |   zone_id = aws_route53_zone.analytics_usa_gov_zone.zone_id
		11 |   name    = "analytics.usa.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d2rprfiomwib2l.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.calc_gsa_gov_calc_gsa_gov_a
	File: /calc.gsa.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "calc_gsa_gov_calc_gsa_gov_a" {
		10 |   zone_id = aws_route53_zone.calc_gsa_gov_zone.zone_id
		11 |   name    = "calc.gsa.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d3ulj13shqrbkv.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.code_gov_apex
	File: /code.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "code_gov_apex" {
		10 |   zone_id = aws_route53_zone.code_toplevel.zone_id
		11 |   name    = "code.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "dqziuvpgrykcy.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.code_gov_www
	File: /code.gov.tf:33-43
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		33 | resource "aws_route53_record" "code_gov_www" {
		34 |   zone_id = aws_route53_zone.code_toplevel.zone_id
		35 |   name    = "www.code.gov."
		36 |   type    = "A"
		37 | 
		38 |   alias {
		39 |     name                   = "dqziuvpgrykcy.cloudfront.net."
		40 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		41 |     evaluate_target_health = false
		42 |   }
		43 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.staging_code_gov_a
	File: /code.gov.tf:57-67
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		57 | resource "aws_route53_record" "staging_code_gov_a" {
		58 |   zone_id = aws_route53_zone.code_toplevel.zone_id
		59 |   name    = "staging.code.gov."
		60 |   type    = "A"
		61 | 
		62 |   alias {
		63 |     name                   = "d3g0jy911fqt1l.cloudfront.net."
		64 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		65 |     evaluate_target_health = false
		66 |   }
		67 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.collegescorecard_ed_gov_collegescorecard_ed_gov_a
	File: /collegescorecard.ed.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "collegescorecard_ed_gov_collegescorecard_ed_gov_a" {
		10 |   zone_id = aws_route53_zone.collegescorecard_ed_gov_zone.zone_id
		11 |   name    = "collegescorecard.ed.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d1a8vwb3lfw7jl.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.datagov_34193244109_a
	File: /data.gov.tf:105-115
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		105 | resource "aws_route53_record" "datagov_34193244109_a" {
		106 |   zone_id = aws_route53_zone.datagov_zone.zone_id
		107 |   name    = "data.gov"
		108 |   type    = "A"
		109 | 
		110 |   alias {
		111 |     name                   = "dg7ira9sfp69m.cloudfront.net."
		112 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		113 |     evaluate_target_health = false
		114 |   }
		115 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.datagov_manage101771786_a
	File: /data.gov.tf:130-138
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		130 | resource "aws_route53_record" "datagov_manage101771786_a" {
		131 |   zone_id = aws_route53_zone.datagov_zone.zone_id
		132 |   name    = "manage"
		133 |   type    = "A"
		134 | 
		135 |   ttl     = 300
		136 |   records = ["10.177.17.86"]
		137 | 
		138 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.datagov_originssmallbusiness1981012551_a
	File: /data.gov.tf:141-149
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		141 | resource "aws_route53_record" "datagov_originssmallbusiness1981012551_a" {
		142 |   zone_id = aws_route53_zone.datagov_zone.zone_id
		143 |   name    = "origins-smallbusiness"
		144 |   type    = "A"
		145 | 
		146 |   ttl     = 300
		147 |   records = ["198.10.125.51"]
		148 | 
		149 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.digital_gov_apex
	File: /digital.gov.tf:15-25
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		15 | resource "aws_route53_record" "digital_gov_apex" {
		16 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		17 |   name    = "digital.gov."
		18 |   type    = "A"
		19 | 
		20 |   alias {
		21 |     name                   = "d2q1i25any8vwy.cloudfront.net."
		22 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		23 |     evaluate_target_health = false
		24 |   }
		25 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.digital_gov_www
	File: /digital.gov.tf:40-50
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		40 | resource "aws_route53_record" "digital_gov_www" {
		41 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		42 |   name    = "www.digital.gov."
		43 |   type    = "A"
		44 | 
		45 |   alias {
		46 |     name                   = "d11gdxqvugzxkr.cloudfront.net."
		47 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		48 |     evaluate_target_health = false
		49 |   }
		50 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.designsystem_digital_gov_a
	File: /digital.gov.tf:80-89
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		80 | resource "aws_route53_record" "designsystem_digital_gov_a" {
		81 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		82 |   name    = "designsystem.digital.gov."
		83 |   type    = "A"
		84 |   alias {
		85 |     name                   = "dlu3fkwowya06.cloudfront.net."
		86 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		87 |     evaluate_target_health = false
		88 |   }
		89 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.v1_designsystem_digital_gov_a
	File: /digital.gov.tf:125-134
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		125 | resource "aws_route53_record" "v1_designsystem_digital_gov_a" {
		126 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		127 |   name    = "v1.designsystem.digital.gov."
		128 |   type    = "A"
		129 |   alias {
		130 |     name                   = "d5bhevr9bklr9.cloudfront.net."
		131 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		132 |     evaluate_target_health = false
		133 |   }
		134 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.public_sans_digital_gov_a
	File: /digital.gov.tf:166-175
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		166 | resource "aws_route53_record" "public_sans_digital_gov_a" {
		167 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		168 |   name    = "public-sans.digital.gov."
		169 |   type    = "A"
		170 |   alias {
		171 |     name                   = "d30jruftdogur6.cloudfront.net."
		172 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		173 |     evaluate_target_health = false
		174 |   }
		175 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.accessibility_digital_gov_a
	File: /digital.gov.tf:189-198
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		189 | resource "aws_route53_record" "accessibility_digital_gov_a" {
		190 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		191 |   name    = "accessibility.digital.gov."
		192 |   type    = "A"
		193 |   alias {
		194 |     name                   = "d2hlc5rjmtb40x.cloudfront.net."
		195 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		196 |     evaluate_target_health = false
		197 |   }
		198 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.demo_accessibility_digital_gov_a
	File: /digital.gov.tf:212-221
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		212 | resource "aws_route53_record" "demo_accessibility_digital_gov_a" {
		213 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		214 |   name    = "demo.accessibility.digital.gov."
		215 |   type    = "A"
		216 |   alias {
		217 |     name                   = "dnt48lkpo0ew7.cloudfront.net."
		218 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		219 |     evaluate_target_health = false
		220 |   }
		221 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.pra_digital_gov_a
	File: /digital.gov.tf:253-262
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		253 | resource "aws_route53_record" "pra_digital_gov_a" {
		254 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		255 |   name    = "pra.digital.gov."
		256 |   type    = "A"
		257 |   alias {
		258 |     name                   = "d3vwm5h0acan67.cloudfront.net."
		259 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		260 |     evaluate_target_health = false
		261 |   }
		262 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.demo_pra_digital_gov_a
	File: /digital.gov.tf:276-285
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		276 | resource "aws_route53_record" "demo_pra_digital_gov_a" {
		277 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		278 |   name    = "demo.pra.digital.gov."
		279 |   type    = "A"
		280 |   alias {
		281 |     name                   = "d18cp08a73t0c1.cloudfront.net."
		282 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		283 |     evaluate_target_health = false
		284 |   }
		285 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.demo_touchpoints_digital_gov_a
	File: /digital.gov.tf:303-312
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		303 | resource "aws_route53_record" "demo_touchpoints_digital_gov_a" {
		304 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		305 |   name    = "demo.touchpoints.digital.gov."
		306 |   type    = "A"
		307 |   alias {
		308 |     name                   = "dcxk3q3d8gzx7.cloudfront.net."
		309 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		310 |     evaluate_target_health = false
		311 |   }
		312 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.touchpoints_digital_gov_a
	File: /digital.gov.tf:408-417
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		408 | resource "aws_route53_record" "touchpoints_digital_gov_a" {
		409 |   zone_id = aws_route53_zone.digital_toplevel.zone_id
		410 |   name    = "touchpoints.digital.gov."
		411 |   type    = "A"
		412 |   alias {
		413 |     name                   = "d5n0pmq4ueiac.cloudfront.net."
		414 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		415 |     evaluate_target_health = false
		416 |   }
		417 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.digitalgov_gov_apex
	File: /digitalgov.gov.tf:34-43
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		34 | resource "aws_route53_record" "digitalgov_gov_apex" {
		35 |   zone_id = aws_route53_zone.digitalgov_gov_zone.zone_id
		36 |   name    = "digitalgov.gov."
		37 |   type    = "A"
		38 |   alias {
		39 |     name                   = "dj62070yqrr60.cloudfront.net."
		40 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		41 |     evaluate_target_health = false
		42 |   }
		43 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.digitalgov_gov_openopps_digitalgov_gov_a
	File: /digitalgov.gov.tf:69-78
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		69 | resource "aws_route53_record" "digitalgov_gov_openopps_digitalgov_gov_a" {
		70 |   zone_id = aws_route53_zone.digitalgov_gov_zone.zone_id
		71 |   name    = "openopps.digitalgov.gov."
		72 |   type    = "A"
		73 |   alias {
		74 |     name                   = "d198punmzgrl9l.cloudfront.net."
		75 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		76 |     evaluate_target_health = false
		77 |   }
		78 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.o166_email_digitalgov_gov_a
	File: /digitalgov.gov.tf:187-195
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		187 | resource "aws_route53_record" "o166_email_digitalgov_gov_a" {
		188 |   zone_id = aws_route53_zone.digitalgov_gov_zone.zone_id
		189 |   name    = "o166.email.digitalgov.gov."
		190 |   type    = "A"
		191 |   ttl     = "300"
		192 |   records = [
		193 |     "167.89.86.190"
		194 |   ]
		195 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.admin_digitalgov_gov_a
	File: /digitalgov.gov.tf:199-207
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		199 | resource "aws_route53_record" "admin_digitalgov_gov_a" {
		200 |   zone_id = aws_route53_zone.digitalgov_gov_zone.zone_id
		201 |   name    = "admin.digitalgov.gov."
		202 |   type    = "A"
		203 |   ttl     = "600"
		204 |   records = [
		205 |     "173.203.40.168"
		206 |   ]
		207 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.support_digitalgov_gov_a
	File: /digitalgov.gov.tf:214-223
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		214 | resource "aws_route53_record" "support_digitalgov_gov_a" {
		215 |   zone_id = aws_route53_zone.digitalgov_gov_zone.zone_id
		216 |   name    = "support.digitalgov.gov."
		217 |   type    = "A"
		218 |   ttl     = "600"
		219 |   records = [
		220 |     "216.128.241.47",
		221 |     "173.252.148.104",
		222 |   ]
		223 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.discovery_gsa_gov_discovery_gsa_gov_a
	File: /discovery.gsa.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "discovery_gsa_gov_discovery_gsa_gov_a" {
		10 |   zone_id = aws_route53_zone.discovery_gsa_gov_zone.zone_id
		11 |   name    = "discovery.gsa.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d11du9vova78yj.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.fac_gov_fac_gov_a
	File: /fac.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "fac_gov_fac_gov_a" {
		10 |   zone_id = aws_route53_zone.fac_gov_zone.zone_id
		11 |   name    = "fac.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d3bkpuj8pzucbe.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.https_cio_gov_https_cio_gov_a
	File: /https.cio.gov.tf:10-20
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		10 | resource "aws_route53_record" "https_cio_gov_https_cio_gov_a" {
		11 |   zone_id = aws_route53_zone.https_cio_gov_zone.zone_id
		12 |   name    = "https.cio.gov."
		13 |   type    = "A"
		14 | 
		15 |   alias {
		16 |     name                   = "d2h7trd5jt3vay.cloudfront.net."
		17 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		18 |     evaluate_target_health = false
		19 |   }
		20 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.innovation_gov_apex
	File: /innovation.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "innovation_gov_apex" {
		10 |   zone_id = aws_route53_zone.innovation_toplevel.zone_id
		11 |   name    = "innovation.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d2ntl68ywjm643.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.innovation_gov_www
	File: /innovation.gov.tf:33-43
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		33 | resource "aws_route53_record" "innovation_gov_www" {
		34 |   zone_id = aws_route53_zone.innovation_toplevel.zone_id
		35 |   name    = "www.innovation.gov."
		36 |   type    = "A"
		37 | 
		38 |   alias {
		39 |     name                   = "d2ntl68ywjm643.cloudfront.net."
		40 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		41 |     evaluate_target_health = false
		42 |   }
		43 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.demo_innovation_gov_a
	File: /innovation.gov.tf:57-67
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		57 | resource "aws_route53_record" "demo_innovation_gov_a" {
		58 |   zone_id = aws_route53_zone.innovation_toplevel.zone_id
		59 |   name    = "demo.innovation.gov."
		60 |   type    = "A"
		61 | 
		62 |   alias {
		63 |     name                   = "d3am9l7wwd0yie.cloudfront.net."
		64 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		65 |     evaluate_target_health = false
		66 |   }
		67 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.open_foia_gov_open_foia_gov_a
	File: /open.foia.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "open_foia_gov_open_foia_gov_a" {
		10 |   zone_id = aws_route53_zone.open_foia_gov_zone.zone_id
		11 |   name    = "open.foia.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d23kapr45ru7n0.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.www
	File: /pif.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "www" {
		10 |   zone_id = aws_route53_zone.pif_toplevel.zone_id
		11 |   name    = "pif.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "dgevgiwb7xxpw.cloudfront.net"
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.www-main
	File: /pif.gov.tf:170-180
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		170 | resource "aws_route53_record" "www-main" {
		171 |   zone_id = aws_route53_zone.pif_toplevel.zone_id
		172 |   name    = "www.pif.gov."
		173 |   type    = "A"
		174 | 
		175 |   alias {
		176 |     name                   = "dgevgiwb7xxpw.cloudfront.net"
		177 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		178 |     evaluate_target_health = false
		179 |   }
		180 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.plainlanguage_apex_alias
	File: /plainlanguage.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "plainlanguage_apex_alias" {
		10 |   zone_id = aws_route53_zone.plainlanguage_toplevel.zone_id
		11 |   name    = "plainlanguage.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d2uz68wjkv6tls.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.presidentialinnovationfellows_www
	File: /presidentialinnovationfellows.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "presidentialinnovationfellows_www" {
		10 |   zone_id = aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id
		11 |   name    = "www.presidentialinnovationfellows.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d26prp92rpqmzl.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.presidentialinnovationfellows_apex
	File: /presidentialinnovationfellows.gov.tf:34-44
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		34 | resource "aws_route53_record" "presidentialinnovationfellows_apex" {
		35 |   zone_id = aws_route53_zone.presidentialinnovationfellows_toplevel.zone_id
		36 |   name    = "presidentialinnovationfellows.gov."
		37 |   type    = "A"
		38 | 
		39 |   alias {
		40 |     name                   = "d26prp92rpqmzl.cloudfront.net."
		41 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		42 |     evaluate_target_health = false
		43 |   }
		44 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.pulse_cio_gov_pulse_cio_gov_a
	File: /pulse.cio.gov.tf:14-24
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		14 | resource "aws_route53_record" "pulse_cio_gov_pulse_cio_gov_a" {
		15 |   zone_id = aws_route53_zone.pulse_cio_gov_zone.zone_id
		16 |   name    = "pulse.cio.gov."
		17 |   type    = "A"
		18 | 
		19 |   alias {
		20 |     name                   = local.pulse_cloudfront
		21 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		22 |     evaluate_target_health = false
		23 |   }
		24 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.sbst_gov_sbst_gov_a
	File: /sbst.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "sbst_gov_sbst_gov_a" {
		10 |   zone_id = aws_route53_zone.sbst_gov_zone.zone_id
		11 |   name    = "sbst.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "d277n30llb5z4h.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.sbst_gov_www_sbst_gov_a
	File: /sbst.gov.tf:33-43
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		33 | resource "aws_route53_record" "sbst_gov_www_sbst_gov_a" {
		34 |   zone_id = aws_route53_zone.sbst_gov_zone.zone_id
		35 |   name    = "www.sbst.gov."
		36 |   type    = "A"
		37 | 
		38 |   alias {
		39 |     name                   = "d277n30llb5z4h.cloudfront.net."
		40 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		41 |     evaluate_target_health = false
		42 |   }
		43 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.search_gov_apex
	File: /search.gov.tf:9-19
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "search_gov_apex" {
		10 |   zone_id = aws_route53_zone.search_toplevel.zone_id
		11 |   name    = "search.gov."
		12 |   type    = "A"
		13 | 
		14 |   alias {
		15 |     name                   = "dcp2c9fh8vtdl.cloudfront.net."
		16 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		17 |     evaluate_target_health = false
		18 |   }
		19 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.search_gov_www
	File: /search.gov.tf:34-44
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		34 | resource "aws_route53_record" "search_gov_www" {
		35 |   zone_id = aws_route53_zone.search_toplevel.zone_id
		36 |   name    = "www.search.gov."
		37 |   type    = "A"
		38 | 
		39 |   alias {
		40 |     name                   = "dv0x4a4ilr842.cloudfront.net."
		41 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		42 |     evaluate_target_health = false
		43 |   }
		44 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.search_gov_downtime
	File: /search.gov.tf:68-74
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		68 | resource "aws_route53_record" "search_gov_downtime" {
		69 |   zone_id = aws_route53_zone.search_toplevel.zone_id
		70 |   name    = "admin-center-downtime.search.gov."
		71 |   type    = "A"
		72 |   records = ["34.238.89.30"]
		73 |   ttl     = "300"
		74 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.tts_gsa_gov_a
	File: /tts.gsa.gov.tf:9-15
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		9  | resource "aws_route53_record" "tts_gsa_gov_a" {
		10 |   zone_id = aws_route53_zone.tts_gsa_gov_zone.zone_id
		11 |   name    = "tts.gsa.gov."
		12 |   type    = "A"
		13 |   records = ["159.142.191.107"]
		14 |   ttl     = "300"
		15 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.usa_gov_analytics_usa_gov_a
	File: /usa.gov.tf:8-17
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		8  | resource "aws_route53_record" "usa_gov_analytics_usa_gov_a" {
		9  |   zone_id = aws_route53_zone.usa_gov_zone.zone_id
		10 |   name    = "analytics.usa.gov."
		11 |   type    = "A"
		12 |   alias {
		13 |     name                   = "dkm80j4hktly2.cloudfront.net."
		14 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		15 |     evaluate_target_health = false
		16 |   }
		17 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.usability_gov_apex
	File: /usability.gov.tf:13-23
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		13 | resource "aws_route53_record" "usability_gov_apex" {
		14 |   zone_id = aws_route53_zone.usability_toplevel.zone_id
		15 |   name    = "usability.gov."
		16 |   type    = "A"
		17 | 
		18 |   alias {
		19 |     name                   = "d2yghjaoiuwpg5.cloudfront.net."
		20 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		21 |     evaluate_target_health = false
		22 |   }
		23 | }

Check: CKV2_AWS_23: "Route53 A Record has Attached Resource"
	FAILED for resource: aws_route53_record.vote_gov_vote_gov_a
	File: /vote.gov.tf:219-228
	Guide: https://docs.bridgecrew.io/docs/ensure-route53-a-record-has-an-attached-resource

		219 | resource "aws_route53_record" "vote_gov_vote_gov_a" {
		220 |   zone_id = aws_route53_zone.vote_gov_zone.zone_id
		221 |   name    = "vote.gov."
		222 |   type    = "A"
		223 |   alias {
		224 |     name                   = "d2s5gzwyabrtbd.cloudfront.net"
		225 |     zone_id                = local.cloud_gov_cloudfront_zone_id
		226 |     evaluate_target_health = false
		227 |   }
		228 | }
```

CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"

```
Check: CKV_AWS_144: "Ensure that S3 bucket has cross-region replication enabled"
	FAILED for resource: aws_s3_bucket.backend
	File: /bootstrap/init.tf:6-12
	Guide: https://docs.bridgecrew.io/docs/ensure-that-s3-bucket-has-cross-region-replication-enabled

		6  | resource "aws_s3_bucket" "backend" {
		7  |   bucket = "tts-dns-terraform-state"
		8  | 
		9  |   versioning {
		10 |     enabled = true
		11 |   }
		12 | }
```

CKV2_AWS_62: "Ensure S3 buckets should have event notifications enabled"

```
Check: CKV2_AWS_62: "Ensure S3 buckets should have event notifications enabled"
	FAILED for resource: aws_s3_bucket.backend
	File: /bootstrap/init.tf:6-12

		6  | resource "aws_s3_bucket" "backend" {
		7  |   bucket = "tts-dns-terraform-state"
		8  | 
		9  |   versioning {
		10 |     enabled = true
		11 |   }
		12 | }
```

CKV_AWS_145: "Ensure that S3 buckets are encrypted with KMS by default"

```
Check: CKV_AWS_145: "Ensure that S3 buckets are encrypted with KMS by default"
	FAILED for resource: aws_s3_bucket.backend
	File: /bootstrap/init.tf:6-12
	Guide: https://docs.bridgecrew.io/docs/ensure-that-s3-buckets-are-encrypted-with-kms-by-default

		6  | resource "aws_s3_bucket" "backend" {
		7  |   bucket = "tts-dns-terraform-state"
		8  | 
		9  |   versioning {
		10 |     enabled = true
		11 |   }
		12 | }
```

CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"

```
Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.d_18f_gov_zone
	File: /18f.gov.tf:1-7

		1 | resource "aws_route53_zone" "d_18f_gov_zone" {
		2 |   name = "18f.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.analytics_usa_gov_zone
	File: /analytics.usa.gov.tf:1-7

		1 | resource "aws_route53_zone" "analytics_usa_gov_zone" {
		2 |   name = "analytics.usa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.calc_gsa_gov_zone
	File: /calc.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "calc_gsa_gov_zone" {
		2 |   name = "calc.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.cld_epa_gov_zone
	File: /cld.epa.gov.tf:1-7

		1 | resource "aws_route53_zone" "cld_epa_gov_zone" {
		2 |   name = "cld.epa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.code_toplevel
	File: /code.gov.tf:1-7

		1 | resource "aws_route53_zone" "code_toplevel" {
		2 |   name = "code.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.collegescorecard_ed_gov_zone
	File: /collegescorecard.ed.gov.tf:1-7

		1 | resource "aws_route53_zone" "collegescorecard_ed_gov_zone" {
		2 |   name = "collegescorecard.ed.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.digital_toplevel
	File: /digital.gov.tf:7-13

		7  | resource "aws_route53_zone" "digital_toplevel" {
		8  |   name = "digital.gov"
		9  | 
		10 |   tags = {
		11 |     Project = "dns"
		12 |   }
		13 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.digitalgov_gov_zone
	File: /digitalgov.gov.tf:18-23

		18 | resource "aws_route53_zone" "digitalgov_gov_zone" {
		19 |   name = "digitalgov.gov."
		20 |   tags = {
		21 |     Project = "dns"
		22 |   }
		23 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.discovery_gsa_gov_zone
	File: /discovery.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "discovery_gsa_gov_zone" {
		2 |   name = "discovery.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.fac_gov_zone
	File: /fac.gov.tf:1-7

		1 | resource "aws_route53_zone" "fac_gov_zone" {
		2 |   name = "fac.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.gsaforecast_gsa_gov_zone
	File: /gsaforecast.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "gsaforecast_gsa_gov_zone" {
		2 |   name = "gsaforecast.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.https_cio_gov_zone
	File: /https.cio.gov.tf:1-8

		1 | resource "aws_route53_zone" "https_cio_gov_zone" {
		2 |   name = "https.cio.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |     client  = "OGP-20150420-20150930-01"
		7 |   }
		8 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.innovation_toplevel
	File: /innovation.gov.tf:1-7

		1 | resource "aws_route53_zone" "innovation_toplevel" {
		2 |   name = "innovation.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.notify_gov_zone
	File: /notify.gov.tf:1-7

		1 | resource "aws_route53_zone" "notify_gov_zone" {
		2 |     name = "notify.gov."
		3 | 
		4 |     tags = {
		5 |         Project = "dns"
		6 |     }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.open_foia_gov_zone
	File: /open.foia.gov.tf:1-7

		1 | resource "aws_route53_zone" "open_foia_gov_zone" {
		2 |   name = "open.foia.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.pif_toplevel
	File: /pif.gov.tf:1-7

		1 | resource "aws_route53_zone" "pif_toplevel" {
		2 |   name = "pif.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.plainlanguage_toplevel
	File: /plainlanguage.gov.tf:1-7

		1 | resource "aws_route53_zone" "plainlanguage_toplevel" {
		2 |   name = "plainlanguage.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.presidentialinnovationfellows_toplevel
	File: /presidentialinnovationfellows.gov.tf:1-7

		1 | resource "aws_route53_zone" "presidentialinnovationfellows_toplevel" {
		2 |   name = "presidentialinnovationfellows.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.pulse_cio_gov_zone
	File: /pulse.cio.gov.tf:1-8

		1 | resource "aws_route53_zone" "pulse_cio_gov_zone" {
		2 |   name = "pulse.cio.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |     client  = "OGP-20150420-20150930-01"
		7 |   }
		8 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.sbst_gov_zone
	File: /sbst.gov.tf:1-7

		1 | resource "aws_route53_zone" "sbst_gov_zone" {
		2 |   name = "sbst.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.search_toplevel
	File: /search.gov.tf:1-7

		1 | resource "aws_route53_zone" "search_toplevel" {
		2 |   name = "search.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.tts_gsa_gov_zone
	File: /tts.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "tts_gsa_gov_zone" {
		2 |   name = "tts.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.usa_gov_zone
	File: /usa.gov.tf:1-6

		1 | resource "aws_route53_zone" "usa_gov_zone" {
		2 |   name = "usa.gov."
		3 |   tags = {
		4 |     Project = "dns"
		5 |   }
		6 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.usability_toplevel
	File: /usability.gov.tf:6-11

		6  | resource "aws_route53_zone" "usability_toplevel" {
		7  |   name = "usability.gov"
		8  |   tags = {
		9  |     Project = "dns"
		10 |   }
		11 | }

Check: CKV2_AWS_38: "Ensure Domain Name System Security Extensions (DNSSEC) signing is enabled for Amazon Route 53 public hosted zones"
	FAILED for resource: aws_route53_zone.vote_gov_zone
	File: /vote.gov.tf:1-6

		1 | resource "aws_route53_zone" "vote_gov_zone" {
		2 |   name = "vote.gov."
		3 |   tags = {
		4 |     Project = "dns"
		5 |   }
		6 | }
```

CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"

```
Check: CKV_AWS_18: "Ensure the S3 bucket has access logging enabled"
	FAILED for resource: aws_s3_bucket.backend
	File: /bootstrap/init.tf:6-12
	Guide: https://docs.bridgecrew.io/docs/s3_13-enable-logging

		6  | resource "aws_s3_bucket" "backend" {
		7  |   bucket = "tts-dns-terraform-state"
		8  | 
		9  |   versioning {
		10 |     enabled = true
		11 |   }
		12 | }
```

CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"

```
Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.d_18f_gov_zone
	File: /18f.gov.tf:1-7

		1 | resource "aws_route53_zone" "d_18f_gov_zone" {
		2 |   name = "18f.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.analytics_usa_gov_zone
	File: /analytics.usa.gov.tf:1-7

		1 | resource "aws_route53_zone" "analytics_usa_gov_zone" {
		2 |   name = "analytics.usa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.calc_gsa_gov_zone
	File: /calc.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "calc_gsa_gov_zone" {
		2 |   name = "calc.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.cld_epa_gov_zone
	File: /cld.epa.gov.tf:1-7

		1 | resource "aws_route53_zone" "cld_epa_gov_zone" {
		2 |   name = "cld.epa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.code_toplevel
	File: /code.gov.tf:1-7

		1 | resource "aws_route53_zone" "code_toplevel" {
		2 |   name = "code.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.collegescorecard_ed_gov_zone
	File: /collegescorecard.ed.gov.tf:1-7

		1 | resource "aws_route53_zone" "collegescorecard_ed_gov_zone" {
		2 |   name = "collegescorecard.ed.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.datagov_zone
	File: /data.gov.tf:1-7

		1 | resource "aws_route53_zone" "datagov_zone" {
		2 | 
		3 |   name = "data.gov"
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.digital_toplevel
	File: /digital.gov.tf:7-13

		7  | resource "aws_route53_zone" "digital_toplevel" {
		8  |   name = "digital.gov"
		9  | 
		10 |   tags = {
		11 |     Project = "dns"
		12 |   }
		13 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.digitalgov_gov_zone
	File: /digitalgov.gov.tf:18-23

		18 | resource "aws_route53_zone" "digitalgov_gov_zone" {
		19 |   name = "digitalgov.gov."
		20 |   tags = {
		21 |     Project = "dns"
		22 |   }
		23 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.discovery_gsa_gov_zone
	File: /discovery.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "discovery_gsa_gov_zone" {
		2 |   name = "discovery.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.fac_gov_zone
	File: /fac.gov.tf:1-7

		1 | resource "aws_route53_zone" "fac_gov_zone" {
		2 |   name = "fac.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.gsaforecast_gsa_gov_zone
	File: /gsaforecast.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "gsaforecast_gsa_gov_zone" {
		2 |   name = "gsaforecast.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.https_cio_gov_zone
	File: /https.cio.gov.tf:1-8

		1 | resource "aws_route53_zone" "https_cio_gov_zone" {
		2 |   name = "https.cio.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |     client  = "OGP-20150420-20150930-01"
		7 |   }
		8 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.innovation_toplevel
	File: /innovation.gov.tf:1-7

		1 | resource "aws_route53_zone" "innovation_toplevel" {
		2 |   name = "innovation.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.notify_gov_zone
	File: /notify.gov.tf:1-7

		1 | resource "aws_route53_zone" "notify_gov_zone" {
		2 |     name = "notify.gov."
		3 | 
		4 |     tags = {
		5 |         Project = "dns"
		6 |     }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.open_foia_gov_zone
	File: /open.foia.gov.tf:1-7

		1 | resource "aws_route53_zone" "open_foia_gov_zone" {
		2 |   name = "open.foia.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.pif_toplevel
	File: /pif.gov.tf:1-7

		1 | resource "aws_route53_zone" "pif_toplevel" {
		2 |   name = "pif.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.plainlanguage_toplevel
	File: /plainlanguage.gov.tf:1-7

		1 | resource "aws_route53_zone" "plainlanguage_toplevel" {
		2 |   name = "plainlanguage.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.presidentialinnovationfellows_toplevel
	File: /presidentialinnovationfellows.gov.tf:1-7

		1 | resource "aws_route53_zone" "presidentialinnovationfellows_toplevel" {
		2 |   name = "presidentialinnovationfellows.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.pulse_cio_gov_zone
	File: /pulse.cio.gov.tf:1-8

		1 | resource "aws_route53_zone" "pulse_cio_gov_zone" {
		2 |   name = "pulse.cio.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |     client  = "OGP-20150420-20150930-01"
		7 |   }
		8 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.sbst_gov_zone
	File: /sbst.gov.tf:1-7

		1 | resource "aws_route53_zone" "sbst_gov_zone" {
		2 |   name = "sbst.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.search_toplevel
	File: /search.gov.tf:1-7

		1 | resource "aws_route53_zone" "search_toplevel" {
		2 |   name = "search.gov"
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.tts_gsa_gov_zone
	File: /tts.gsa.gov.tf:1-7

		1 | resource "aws_route53_zone" "tts_gsa_gov_zone" {
		2 |   name = "tts.gsa.gov."
		3 | 
		4 |   tags = {
		5 |     Project = "dns"
		6 |   }
		7 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.usa_gov_zone
	File: /usa.gov.tf:1-6

		1 | resource "aws_route53_zone" "usa_gov_zone" {
		2 |   name = "usa.gov."
		3 |   tags = {
		4 |     Project = "dns"
		5 |   }
		6 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.usability_toplevel
	File: /usability.gov.tf:6-11

		6  | resource "aws_route53_zone" "usability_toplevel" {
		7  |   name = "usability.gov"
		8  |   tags = {
		9  |     Project = "dns"
		10 |   }
		11 | }

Check: CKV2_AWS_39: "Ensure Domain Name System (DNS) query logging is enabled for Amazon Route 53 hosted zones"
	FAILED for resource: aws_route53_zone.vote_gov_zone
	File: /vote.gov.tf:1-6

		1 | resource "aws_route53_zone" "vote_gov_zone" {
		2 |   name = "vote.gov."
		3 |   tags = {
		4 |     Project = "dns"
		5 |   }
		6 | }
```

CKV2_AWS_6: "Ensure that S3 bucket has a Public Access block"

```
Check: CKV2_AWS_6: "Ensure that S3 bucket has a Public Access block"
	FAILED for resource: aws_s3_bucket.backend
	File: /bootstrap/init.tf:6-12
	Guide: https://docs.bridgecrew.io/docs/s3-bucket-should-have-public-access-blocks-defaults-to-false-if-the-public-access-block-is-not-attached

		6  | resource "aws_s3_bucket" "backend" {
		7  |   bucket = "tts-dns-terraform-state"
		8  | 
		9  |   versioning {
		10 |     enabled = true
		11 |   }
		12 | }
```