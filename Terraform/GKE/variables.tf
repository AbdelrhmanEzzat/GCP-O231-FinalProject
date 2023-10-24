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


variable "workload_subnet" {
  description = "Name of workload_subnet"
  type        = string
}

variable "gke_service_account_email" {
  description = "Name of management_subnet"
  type        = string
}

variable "management_subnet_cidr" {
  type = string
}
