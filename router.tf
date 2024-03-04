# Cloud Router enables you to dynamically exchange routes between your Virtual Private Cloud (VPC) and peer network by using Border Gateway Protocol (BGP).
resource "google_compute_router" "router" {
  name    = "router-project"
  region  = "us-central1"
  network = google_compute_network.vpc_network.id
}

# Enables you to provision your application instances without public IP addresses while also allowing them to access the internet.
resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat.self-link]
}

resource "google_compute_address" "nat" {
    name = "nat"
    address_type = "EXTERNAL"
    network_tier = "STANDARD"

    depends_on = [google_project_service.compute_api]
}
