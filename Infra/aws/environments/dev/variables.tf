variable "region" {}
variable "project_name" {}
variable "environment" {}
variable "vpc_cidr" {}

variable "public_subnet_a_cidr" {}
variable "public_subnet_b_cidr" {}
variable "private_subnet_a_cidr" {}
variable "private_subnet_b_cidr" {}

variable "az_a" {}
variable "az_b" {}

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