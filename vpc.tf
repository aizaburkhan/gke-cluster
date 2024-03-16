resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
  project = var.project_name 

}

resource "google_project_service" "container_api" {
  service = "container.googleapis.com"
  project = var.project_name 
}

resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  project                 = var.project_name 
  routing_mode            = "REGIONAL"
  auto_create_subnetworks = false  #when set to "false" the network is created in custom subnet mode"
  mtu                     = 1460
  delete_default_routes_on_create = false  #when set to "true" it will delete the default route to the Internet

  depends_on = [
    google_project_service.compute_api,
    google_project_service.container_api
  ]
  }

