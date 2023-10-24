output "vm_service_account_email" {
  description = "The email address of the VM instance service account"
  value       = google_service_account.vm_service_account.email
}

output "gke_service_account_email" {
  description = "The email address of the cluster service account"
  value       = google_service_account.gke_service_account.email
}
