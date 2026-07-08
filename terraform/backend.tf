terraform {
  backend "s3" {
    bucket       = "resil-aws-3tier-terraform-state-271251458153"
    key          = "envs/portfolio/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
