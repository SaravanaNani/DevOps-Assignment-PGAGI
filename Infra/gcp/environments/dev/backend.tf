terraform {
  backend "gcs" {
    bucket = "$YOUR_BUCKET_NAME"
    prefix = "gcp/dev"
  }
}
