provider "google" {
  region  = var.region
}

 terraform { 
  backend "gcs" {
    bucket  = "kubernetes-dashboard-group3" #Cannot use variables.
    prefix = "terraform/state"
  }

    required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
 }

