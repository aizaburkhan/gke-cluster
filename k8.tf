resource "google_container_cluster" "primary" {
  name     = "group3-project"
  location = "us-central1"
  # We can't create a cluster with no node pool defined, but we want to only use separately managed node pools. So we create the smallest possible default node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network    = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.private.self-link
  networking_mode = "VPC_NATIVE"
}

resource "google_service_account" "kubernetes" {
  account_id   = "kubernetes"
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}