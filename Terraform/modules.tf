module "network" {

  source = "./network"
  vpc_name = var.vpc_name
  project_id =var.project_id
  region = var.region
  sub_cidr = var.sub_cidr
}

module "iam" {
  source = "./IAM"
  project_id = var.project_id
  vm_roles = var.vm_roles
  gke_roles = var.gke_roles
  region = var.region
  vpc_name = var.vpc_name
}

module "compute" {
  source = "./compute"
  vpc_name = var.vpc_name
  project_id = var.project_id
  region = var.region
  management_subnet = module.network.management_subnet
  vm_service_account_email = module.iam.vm_service_account_email
  
}

module "storage" {
  source = "./storage"
  region = var.region
  
}

module "gke" {
  source = "./GKE"
  vpc_name = var.vpc_name
  project_id = var.project_id
  region = var.region
  workload_subnet = module.network.workload_subnet
  management_subnet_cidr = module.network.management_subnet_cidr
  gke_service_account_email = module.iam.gke_service_account_email
  
}