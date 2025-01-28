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