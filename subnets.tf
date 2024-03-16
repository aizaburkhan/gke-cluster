resource "google_compute_subnetwork" "private" {
  name          = var.subnet_name
  project       = var.project_name 
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id  
  private_ip_google_access = true  #VMs without external IPs can access Google API services

  # This secondary IP range might be used to allocate IP addresses specifically for pods in a Kubernetes cluster deployed within the subnetwork. In a Kubernetes environment, each pod typically requires its own IP address, so a separate IP range may be allocated for pod IP addresses to ensure proper network segmentation and efficient IP address management.
  secondary_ip_range {
    range_name    = var.secondary_ip_range1_name
    ip_cidr_range = var.secondary_ip_range1_cidr
  }
  # This secondary IP range might be used to allocate IP addresses specifically for services within the Kubernetes cluster. Kubernetes services require stable IP addresses for communication with pods, so a separate IP range may be allocated for service IP addresses to ensure reliable service discovery and routing within the cluster.
    secondary_ip_range {
    range_name    = var.secondary_ip_range2_name
    ip_cidr_range = var.secondary_ip_range2_cidr
  }
}

