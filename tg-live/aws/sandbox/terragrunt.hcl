remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "terragrunt-state-sandbox-openpayd"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terragrunt-locks-sandbox"
  }
}
inputs = {
  aws_region                   = "eu-central-1"
  aws_profile                  = "default"
  tfstate_global_bucket        = "terragrunt-state-sandbox-openpayd"
  tfstate_global_bucket_region = "eu-central-1"
}
