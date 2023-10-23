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