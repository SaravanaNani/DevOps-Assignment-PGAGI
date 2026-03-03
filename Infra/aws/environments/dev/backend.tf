terraform {
  backend "s3" {
    bucket = "$YOUR_BUCKET_NAME"
    key    = "aws/dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
