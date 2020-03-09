# aws-s3-static-website-project

## Features

Provisioning the following:

- S3 Bucket for static public files
- CloudFront Distribution fronting the S3 Bucket
- Route 53 Public Hosted Zone
- Route 53 Record Set aliased to the CloudFront Distribution
- AWS ACM TLS Certificate

## Modules' Documentation

- [Terraform Module for creating an AWS ACM Certificate](<https://github.com/terraform-aws-modules/terraform-aws-acm.git>)
- [Terraform Module for creating an AWS S3 Static Website](<https://github.com/Xtigyro/terraform-aws-s3-static-website.git>)

## Prerequisites

```console
# terraform -v   # https://www.terraform.io/
Terraform v0.12.23

# terragrunt -v   # https://terragrunt.gruntwork.io/
terragrunt version v0.23.1
```

## Infra Creation and Content Upload

To create the aforementioned infrastructure and upload the website static content - run:

```shell
cd tg-live/aws/sandbox/eu-central-1/aws-s3-static-website
terragrunt apply
```
