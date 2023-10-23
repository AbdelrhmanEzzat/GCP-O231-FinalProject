#Create VPC 

resource "google_compute_network" "abdo_vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}


#Create management_subnet for VM 
resource "google_compute_subnetwork" "management_subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.sub_cidr[0]
  region        = var.region[0]
  network       = google_compute_network.abdo_vpc.id
  
  
}
#Create workload_subnet for VM 
resource "google_compute_subnetwork" "workload_subnet" {
  name          = "workload-subnet"
  ip_cidr_range = var.sub_cidr[1]
  region        = var.region[1]
  network       = google_compute_network.abdo_vpc.id
  

  #can access Google APIs and services by using Private Google Access
  private_ip_google_access = true 

}



#IAP firwall 
resource "google_compute_firewall" "iap_firewall" {

  name    = "ssh-using-iap"

  network = google_compute_network.abdo_vpc.id

    allow {
      protocol = "tcp"
      ports    = ["80", "22"]
    }

  direction     = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
}


## Create Cloud Router

resource "google_compute_router" "router" {
  project = var.project_id
  name    = "nat-router"
  network = google_compute_network.abdo_vpc.id
  region  = google_compute_subnetwork.management_subnet.region
}


## Create Nat Gateway

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }

 
}
