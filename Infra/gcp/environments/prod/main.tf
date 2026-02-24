provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "network" {
  source = "../../modules/network"

  vpc_name      = "${var.project_name}-${var.environment}-vpc"
  subnet_name   = "${var.project_name}-${var.environment}-subnet"
  subnet_cidr   = var.subnet_cidr
  region        = var.region
  router_name   = "${var.project_name}-${var.environment}-router"
  nat_name      = "${var.project_name}-${var.environment}-nat"
  firewall_name = "${var.project_name}-${var.environment}-allow-lb"
}

module "compute" {
  source = "../../modules/compute"

  project_name = var.project_name
  environment  = var.environment
  zone         = var.zone

  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id

  backend_machine_type  = var.backend_machine_type
  frontend_machine_type = var.frontend_machine_type

  backend_min_replicas  = var.backend_min_replicas
  backend_max_replicas  = var.backend_max_replicas

  frontend_min_replicas = var.frontend_min_replicas
  frontend_max_replicas = var.frontend_max_replicas

  backend_startup_script  = "../../../backend-startup.sh"
  frontend_startup_script = "../../../frontend-startup.sh"
}

module "lb" {
  source = "../../modules/lb"

  backend_instance_group  = module.compute.backend_instance_group
  frontend_instance_group = module.compute.frontend_instance_group

  backend_health_check  = module.compute.backend_health_check
  frontend_health_check = module.compute.frontend_health_check

  backend_service_name  = "${var.project_name}-${var.environment}-backend-service"
  frontend_service_name = "${var.project_name}-${var.environment}-frontend-service"
  url_map_name          = "${var.project_name}-${var.environment}-url-map"
  proxy_name            = "${var.project_name}-${var.environment}-proxy"
  forwarding_rule_name  = "${var.project_name}-${var.environment}-forwarding-rule"
}