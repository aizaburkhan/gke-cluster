provider "google" {
  region  = "us-central1"
}

 terraform { 
  backend "gcs" {
    bucket  = "project3-group-hera"
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
 }

# resource "google_project" "group_project4" {
#   name            = "group-project"
#   project_id      = "groupprojecthera4"
#   billing_account = "014687-E3A505-12EFE8"  # Replace with your correct billing account ID
# }

# resource "google_project_service" "project" {
#   project = google_project.group_project4.project_id #variables
#   service = "container.googleapis.com"
#   disable_dependent_services=true
# }

# resource "google_project_service" "project2" {
#   project = google_project.group_project4.project_id #variables
#   service = "compute.googleapis.com"
#   disable_dependent_services=true
# }

# resource "google_service_account" "service_account" {
#   account_id   = "projectgroup3"
#   project = google_project.group_project4.project_id #variables
# }

