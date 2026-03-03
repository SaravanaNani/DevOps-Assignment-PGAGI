terraform {
  backend "s3" {
    bucket = "$YOUR_BUCKET_NAME"
    key    = "aws/prod/terraform.tfstate"
    region = "ap-south-1"
  }
}
