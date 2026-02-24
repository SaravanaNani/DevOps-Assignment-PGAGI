provider "aws" {
  region = var.region
}

module "network" {
  source = "../../modules/network"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr              = var.vpc_cidr
  public_subnet_a_cidr  = var.public_subnet_a_cidr
  public_subnet_b_cidr  = var.public_subnet_b_cidr
  private_subnet_a_cidr = var.private_subnet_a_cidr
  private_subnet_b_cidr = var.private_subnet_b_cidr
  az_a                  = var.az_a
  az_b                  = var.az_b
}

module "alb" {
  source = "../../modules/alb"

  project_name   = var.project_name
  environment    = var.environment
  vpc_id         = module.network.vpc_id
  public_subnets = module.network.public_subnets

  backend_port  = var.backend_port
  frontend_port = var.frontend_port
}

module "compute" {
  source = "../../modules/compute"

  project_name = var.project_name
  environment  = var.environment

  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets

  alb_sg_id = module.alb.alb_sg_id

  backend_port  = var.backend_port
  frontend_port = var.frontend_port

  backend_cpu     = var.backend_cpu
  backend_memory  = var.backend_memory
  frontend_cpu    = var.frontend_cpu
  frontend_memory = var.frontend_memory

  backend_image  = var.backend_image
  frontend_image = var.frontend_image

  backend_desired_count  = var.backend_desired_count
  frontend_desired_count = var.frontend_desired_count

  backend_min_capacity  = var.backend_min_capacity
  backend_max_capacity  = var.backend_max_capacity
  frontend_min_capacity = var.frontend_min_capacity
  frontend_max_capacity = var.frontend_max_capacity

  backend_target_group_arn  = module.alb.backend_target_group_arn
  frontend_target_group_arn = module.alb.frontend_target_group_arn

  backend_listener_dependency  = module.alb.backend_listener_rule_arn
  frontend_listener_dependency = module.alb.http_listener_arn
}