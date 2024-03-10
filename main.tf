provider "google" {
  region  = var.region
}

 terraform { 
  backend "gcs" {
    bucket  = "project10-group-hera" #Cannot use variables.
    prefix = "terraform/state"
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
 }

