
resource "google_compute_instance" "my_vm" {
  project      = var.project_id
  zone         = "${var.region[0]}-b"
  name         = "nat-private-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network    = var.vpc_name
    subnetwork = var.management_subnet

  }
  
service_account {
    email = var.vm_service_account_email
    # email = google_service_account.vm_service_account.email
    
    scopes = [
          "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  metadata_startup_script =file("./compute/script.sh")
}