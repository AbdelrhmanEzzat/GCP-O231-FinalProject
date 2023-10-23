variable "cred_file" {
  description = "Name of the credintial file "
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}
variable "project_id" {
  description = "GCP Project ID"
  type        = string
}
variable "region" {
  type = list(any)
}
variable "sub_cidr" {
  type = list(any)
}

# variable "service_account_id" {
#   description = "ID of the service account"
# }

# variable "service_account_display_name" {
#   description = "Display name of the service account"
# }

# variable "service_account_names" {
#   description = "List of service account names"
#   type        = list(string)
# }

# variable "roles" {
#   description = "List of roles to assign to service accounts"
#   type        = list(string)
# }

# variable "subnet_names" {
#   description = "List of subnet names"
#   type        = list(string)
# }

# variable "firewall_rules" {
#   description = "List of firewall rules"
#   type        = list(string)
# }

# variable "private_vm_name" {
#   description = "Name of the private VM"
#   type        = string
# }

# variable "gke_cluster_name" {
#   description = "Name of the GKE cluster"
#   type        = string
# }

# variable "artifact_registry_repository_name" {
#   description = "Name of the Artifact Registry repository"
#   type        = string
# }
