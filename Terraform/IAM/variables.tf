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

variable "gke_roles" {
  description = "Name of gke_roles"
  type        = list(any)
}
variable "vm_roles" {
  description = "Name of vm_roles"
  type        = list(any)
}


