resource "google_compute_subnetwork" "private" {
  name          = "private"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.id
  private_ip_google_access = true

  # This secondary IP range might be used to allocate IP addresses specifically for pods in a Kubernetes cluster deployed within the subnetwork. In a Kubernetes environment, each pod typically requires its own IP address, so a separate IP range may be allocated for pod IP addresses to ensure proper network segmentation and efficient IP address management.
  secondary_ip_range {
    range_name    = "k8-pod"
    ip_cidr_range = "10.1.0.0/24"
  }
  # This secondary IP range might be used to allocate IP addresses specifically for services within the Kubernetes cluster. Kubernetes services require stable IP addresses for communication with pods, so a separate IP range may be allocated for service IP addresses to ensure reliable service discovery and routing within the cluster.
    secondary_ip_range {
    range_name    = "k8-service"
    ip_cidr_range = "10.2.0.0/24"
  }
}

