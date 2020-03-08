variable "region" {
  description = "AWS Region"
  type        = string
}

variable "cdn_s3_secret" {
  description = "A secret string between CloudFront and S3 to control access"
  type        = string
}

variable "domain" {
  description = "Domain name for the website (i.e. www.example.com)"
  type        = string
}

variable "redirects" {
  description = "A list of domains that should redirect to domain_name (i.e. for redirecting naked domain to www-version)"
  default     = []
}

variable "subject_alternative_names" {
  description = "A list of domains that should be SANs in the issued certificate"
  default     = []
}
