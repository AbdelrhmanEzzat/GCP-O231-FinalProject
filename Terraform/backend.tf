# terraform {
#   backend "gcs" {
#     credentials = var.cred_file
#     bucket  = "abdo-gcp-project-iti"
#     prefix  = "workspaces"
#   }
# }
terraform {
  backend "gcs" {
    bucket         = "abdo-gcp-project"
    prefix         = "terraform/state"
    credentials    =  "tf-owner.json"
  }
}