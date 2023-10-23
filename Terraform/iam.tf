resource "google_service_account" "vm_service_account" {
  account_id   = "vm-machine-service-account"
  display_name = "VM Service Account"
}
resource "google_service_account" "gke_service_account" {
  account_id   = "gke-service-account"
  display_name = "GKE Service Account"
}

resource "google_project_iam_member" "vm_role" {
  count= length(var.vm_roles)
  project = var.project_id
  role    = var.vm_roles[count.index]
  member  = "serviceAccount:${google_service_account.vm_service_account.email}"
  
}
# resource "google_project_iam_member" "vm_role2" {
#   project = var.project_id
#   role    = "roles/storage.admin"
#   member  = "serviceAccount:${google_service_account.vm_service_account.email}"
# }
# resource "google_project_iam_member" "vm_role3" {
#   project = var.project_id
#   role    = "roles/storage.objectViewer"
#   member  = "serviceAccount:${google_service_account.vm_service_account.email}"
# }
# resource "google_project_iam_member" "vm_role4" {
#   project = var.project_id
#   #role    = "roles/storage.objectViewer"
#   role    = "roles/artifactregistry.writer"
#   member  = "serviceAccount:${google_service_account.vm_service_account.email}"
# }

resource "google_project_iam_member" "gke_role" {
  count= length(var.gke_roles)
  project = var.project_id
  role    = var.gke_roles[count.index]
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

# resource "google_project_iam_member" "gke_role2" {
#   project = var.project_id
#   role    = "roles/iam.workloadIdentityUser"
#   member  = "serviceAccount:${google_service_account.gke_service_account.email}"
# }
# resource "google_project_iam_member" "gke_role3" {
#   project = var.project_id
#   role    = "roles/artifactregistry.writer"
#   member  = "serviceAccount:${google_service_account.gke_service_account.email}"
# }