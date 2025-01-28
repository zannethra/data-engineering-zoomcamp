terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.18.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_project_region
}

resource "google_storage_bucket" "ny-taxi-data" {
  name          = format("%s-%s", var.gcp_project_id, var.gcs_taxi_bucket)
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