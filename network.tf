module "network" {

  source = "./network"
  vpc_name = var.vpc_name
  project_id =var.project_id
  region = var.region
  sub_cidr = var.sub_cidr
}
