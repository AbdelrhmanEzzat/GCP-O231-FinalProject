provider "google" {
  credentials = file("${var.cred_file}")

  project = var.project_id
  region  = var.region[0]
  zone    = "${var.region[0]}-a"
}