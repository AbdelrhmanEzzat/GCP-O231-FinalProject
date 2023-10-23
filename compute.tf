
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
    network    = google_compute_network.abdo_vpc.id
    subnetwork = google_compute_subnetwork.management_subnet.id 

  }
  
service_account {
    email = google_service_account.vm_service_account.email
    scopes = [
          "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
  metadata_startup_script =file("script.sh")
}
