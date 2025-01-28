variable "gcp_project_id" {
  default = "taxi-rides-ny-449202"
}

variable "gcp_project_region" {
  default = "us-central1"
}

variable "gcp_location" {
  default = "US"
}

variable "bq_taxi_dataset" {
  default = "taxi_dataset"
}

variable "gcs_taxi_bucket" {
  default = "ny-taxi-data"
}