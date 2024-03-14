provider "google" {
  region  = var.region
}

 terraform { 
  backend "gcs" {
    bucket  = "project-group3-hera" #Cannot use variables.
    prefix = "terraform/state"
  }

  # required_providers {
  #   google = {
  #     source  = "hashicorp/google"
  #     version = "~> 4.0"
  #   }
  # }

    required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
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

