provider "aws" {
  region = var.region
}

terraform {
  required_version = "~> 0.12"

  required_providers {
    aws = "~> 2.52"
  }
}

locals {
  # Use existing (via data source) or create new zone (will fail validation, if zone is not reachable)
  use_existing_route53_zone = false

  # Removing trailing dot from domain - just to be sure :)
  domain_name = trimsuffix(var.domain, ".")
}

data "aws_route53_zone" "this" {
  count = local.use_existing_route53_zone ? 1 : 0

  name         = local.domain_name
  private_zone = false
}

resource "aws_route53_zone" "this" {
  count = ! local.use_existing_route53_zone ? 1 : 0
  name  = local.domain_name
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> v2.0"

  domain_name = local.domain_name
  zone_id     = coalescelist(data.aws_route53_zone.this.*.zone_id, aws_route53_zone.this.*.zone_id)[0]

  subject_alternative_names = [var.subject_alternative_names]

  wait_for_validation = false

  tags = {
    Name = local.domain_name
  }
}

module "s3-static-website" {
  source  = "git::https://github.com/Xtigyro/terraform-aws-s3-static-website.git?ref=v0.0.4"

  domain_name       = local.domain_name
  redirects         = [var.redirects]
  secret            = var.cdn_s3_secret
  cert_arn          = module.acm.this_acm_certificate_arn
  use_route53_zone  = true
  zone_id           = coalescelist(data.aws_route53_zone.this.*.zone_id, aws_route53_zone.this.*.zone_id)[0]

  tags = {
    Name = local.domain_name
  }
}

resource "aws_s3_bucket_object" "static_content" {
  for_each = fileset("${var.static_content_dir}/", "**/*")

  bucket = local.domain_name
  key    = each.value
  source = "${var.static_content_dir}/${each.value}"
  etag   = filemd5("${var.static_content_dir}/${each.value}")
}
