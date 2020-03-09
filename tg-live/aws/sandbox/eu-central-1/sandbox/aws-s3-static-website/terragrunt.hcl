terraform {
  source = "../../../../../..//tf-mods/aws-s3-static-website/"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  region    = "eu-central-1"
  domain    = "my-openpayd-domain.com"
  redirects = [
    "www.my-openpayd-domain.com"
  ]
  subject_alternative_names = [
    "*.my-openpayd-domain.com",
    "app.sub.my-openpayd-domain.com"
  ]
}
