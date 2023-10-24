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

variable "management_subnet" {
  description = "Name of management_subnet"
  type        = string
}
variable "vm_service_account_email" {
  description = "Name of management_subnet"
  type        = string
}


