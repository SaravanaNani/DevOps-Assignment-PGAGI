variable "project_name" {}
variable "environment" {}

variable "vpc_id" {}
variable "private_subnets" { type = list(string) }

variable "alb_sg_id" {}

variable "backend_port" {}
variable "frontend_port" {}

variable "backend_cpu" {}
variable "backend_memory" {}
variable "frontend_cpu" {}
variable "frontend_memory" {}

variable "backend_image" {}
variable "frontend_image" {}

variable "backend_desired_count" {}
variable "frontend_desired_count" {}

variable "backend_min_capacity" {}
variable "backend_max_capacity" {}

variable "frontend_min_capacity" {}
variable "frontend_max_capacity" {}

variable "backend_target_group_arn" {}
variable "frontend_target_group_arn" {}

variable "backend_listener_dependency" {}
variable "frontend_listener_dependency" {}