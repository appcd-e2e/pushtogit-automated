terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    google = {
      source  = "registry.terraform.io/hashicorp/google"
      version = "~> 6.0"
    }
  }
}

resource "google_project" "project" {
  count      = var.create_new_project ? 1 : 0
  project_id = var.project_id
  name       = var.project_id
}

provider "google" {
  project = var.project_id
  region  = var.region
}