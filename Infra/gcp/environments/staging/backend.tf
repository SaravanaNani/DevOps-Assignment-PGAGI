terraform {
  backend "gcs" {
    bucket = "pgagi-terraform-state"
    prefix = "gcp/staging"
  }
}