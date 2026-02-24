variable "project_name" {}
variable "environment" {}
variable "zone" {}
variable "vpc_id" {}
variable "subnet_id" {}

variable "backend_machine_type" {}
variable "frontend_machine_type" {}

variable "backend_min_replicas" {}
variable "backend_max_replicas" {}

variable "frontend_min_replicas" {}
variable "frontend_max_replicas" {}

variable "backend_startup_script" {}
variable "frontend_startup_script" {}