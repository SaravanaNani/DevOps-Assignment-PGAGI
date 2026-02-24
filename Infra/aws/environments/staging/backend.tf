terraform {
  backend "s3" {
    bucket = "pgagi-terraform-state-saravana-71"
    key    = "aws/staging/terraform.tfstate"
    region = "ap-south-1"
  }
}