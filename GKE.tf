resource "google_container_cluster" "private-gke" {
  name                     = "private-cluster"
  location                 = "${var.region[1]}"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.abdo_vpc.id
  subnetwork               = google_compute_subnetwork.workload_subnet.id



  master_authorized_networks_config {
    cidr_blocks {
      cidr_block   = google_compute_subnetwork.management_subnet.ip_cidr_range
      display_name = "external access"
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.32/28"
  
  }
    
}

resource "google_container_node_pool" "node_pool" {
  name       = "node-pool"
  location   = var.region[1]
  cluster    = google_container_cluster.private-gke.id
  node_count = 1
     node_locations = [
    "${var.region[1]}-a",
    "${var.region[1]}-b",
     "${var.region[1]}-c"
     ]

   management {
    auto_repair  = true
    auto_upgrade = true
      }
  
  node_config {
    preemptible  = true
    machine_type = "e2-small"
    service_account = google_service_account.gke_service_account.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}