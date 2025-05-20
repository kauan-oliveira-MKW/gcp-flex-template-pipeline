provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket = "primeiro-bucket-20240514"  # Bucket existente no GCS
    prefix = "dataflow-pipeline"    # Prefixo para organizar estados
  }

  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}