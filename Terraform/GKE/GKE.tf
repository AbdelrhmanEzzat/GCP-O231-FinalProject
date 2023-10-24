resource "google_container_cluster" "private-gke" {
  name                     = "private-cluster"
  location                 = "${var.region[1]}"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc_name
  subnetwork               = var.workload_subnet
  deletion_protection = false



  master_authorized_networks_config {
    cidr_blocks {
      #cidr_block   = google_compute_subnetwork.management_subnet.ip_cidr_range
      cidr_block   = var.management_subnet_cidr
      display_name = "external access"
    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.32/28"
    master_global_access_config {
      enabled = true
    }
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
    service_account = var.gke_service_account_email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  
}