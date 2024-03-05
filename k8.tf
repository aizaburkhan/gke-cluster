resource "google_container_cluster" "primary" {
  name     = "group3-project"
  location = "us-central1"
  # We can't create a cluster with no node pool defined, but we want to only use separately managed node pools. So we create the smallest possible default node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network    = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.private.self_link
  networking_mode = "VPC_NATIVE"
}

resource "google_service_account" "kubernetes" {
  account_id   = "kubernetes"
}


resource "google_container_node_pool" "primary" {
  name       = "primary"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1
  
  management {
    auto_repair = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = "e2-small"

    labels {
      role = "general"
    }

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.kubernetes.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


resource "google_container_node_pool" "spot" {
  name       = "spot"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  
  management {
    auto_repair = true
    auto_upgrade = true
  }
  
  autoscaling {
    min_node_count = 0
    max_node_count = 10
  }

  node_config {
    preemptible  = true
    machine_type = "e2-small"

    labels {
      team = "devops"
    }

    taints {
      key = "instance_type"
      value = "spot"
      effect = "NO_SCHEDULE"
    }

    service_account = google_service_account.kubernetes.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}