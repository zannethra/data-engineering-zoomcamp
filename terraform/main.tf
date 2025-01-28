terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.18.0"
    }
  }
}

provider "google" {
  project = "taxi-rides-ny-449202"
  region  = "us-central1"
}

resource "google_storage_bucket" "ny-taxi-data" {
  name          = "taxi-rides-ny-449202-ny-taxi-data"
  location      = var.gcp_location
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

resource "google_bigquery_dataset" "taxi_dataset" {
  dataset_id = var.bq_taxi_dataset
  location   = var.gcp_location
}