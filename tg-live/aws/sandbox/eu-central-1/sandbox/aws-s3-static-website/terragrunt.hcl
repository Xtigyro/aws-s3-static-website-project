terraform {
  source = "../../../../../..//tf-mods/aws-s3-static-website/"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  region              = "eu-central-1"
  domain              = "my-xtigyro-domain.com"
  static_content_dir  = "/var/www/static-website-example"
  redirects = [
    "www.my-xtigyro-domain.com"
  ]
  subject_alternative_names = [
    "*.my-xtigyro-domain.com",
    "app.sub.my-xtigyro-domain.com"
  ]
}
