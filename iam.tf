resource "google_service_account" "vm_service_account" {
  account_id   = "vm-machine-service-account"
  display_name = "VM Service Account"
}
resource "google_service_account" "gke_service_account" {
  account_id   = "gke-service-account"
  display_name = "GKE Service Account"
}




resource "google_project_iam_member" "vm_role" {
  project = var.project_id
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.vm_service_account.email}"
}
resource "google_project_iam_member" "gke_role" {
  project = var.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}