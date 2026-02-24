terraform {
  backend "s3" {
    bucket = "pgagi-terraform-state-saravana-71"
    key    = "aws/dev/terraform.tfstate"
    region = "ap-south-1"
  }
}