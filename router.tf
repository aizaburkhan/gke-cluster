# Cloud Router enables you to dynamically exchange routes between your Virtual Private Cloud (VPC) and peer network by using Border Gateway Protocol (BGP).
resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.region
  project = var.project_name
  network = google_compute_network.vpc_network.id
}

# Enables you to provision your application instances without public IP addresses while also allowing them to access the internet.
resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  project                            = var.project_name
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region

  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"  #How NAT should be configured per Subnetwork. If ALL_SUBNETWORKS_ALL_IP_RANGES, all of the IP ranges in every Subnetwork are allowed to Nat. If ALL_SUBNETWORKS_ALL_PRIMARY_IP_RANGES, all of the primary IP ranges in every Subnetwork are allowed to Nat. LIST_OF_SUBNETWORKS: A list of Subnetworks are allowed to NAT.
  nat_ip_allocate_option = "MANUAL_ONLY"  #How external IPs should be allocated for this NAT. Valid values are AUTO_ONLY for only allowing NAT IPs allocated by Google Cloud Platform, or MANUAL_ONLY for only user-allocated NAT IP addresses. Possible values are: MANUAL_ONLY, AUTO_ONLY.

  subnetwork {
    name = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }

  nat_ips = [google_compute_address.nat.self_link]
}

resource "google_compute_address" "nat" {
    name = var.compute_address_nat_name
    project = var.project_name
    address_type = "EXTERNAL"
    network_tier = "STANDARD"

    depends_on = [google_project_service.compute_api]
}
