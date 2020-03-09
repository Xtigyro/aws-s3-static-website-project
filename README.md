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
