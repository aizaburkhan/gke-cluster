provider "google" {
  region  = "us-central1"
  project = "certain-ellipse-413904"
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
