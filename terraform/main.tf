terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.18.0"
    }
  }
}

provider "google" {
  credentials = "/Users/zannie/code/dataclub/zoomcamp-keys/terraform/taxi-rides-ny-449202-92d502b7de92.json"
  project     = "taxi-rides-ny-449202"
  region      = "us-central1"
}

resource "google_storage_bucket" "ny-taxi-data" {
  name          = "taxi-rides-ny-449202-ny-taxi-data"
  location      = "US"
  force_destroy = true
  
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}