region = "ap-south-1"

project_name = "pgagi"
environment  = "staging"

vpc_cidr = "10.20.0.0/16"

public_subnet_a_cidr  = "10.20.1.0/24"
public_subnet_b_cidr  = "10.20.2.0/24"
private_subnet_a_cidr = "10.20.3.0/24"
private_subnet_b_cidr = "10.20.4.0/24"

az_a = "ap-south-1a"
az_b = "ap-south-1b"

backend_port  = 8000
frontend_port = 3000

backend_cpu     = "256"
backend_memory  = "512"
frontend_cpu    = "256"
frontend_memory = "512"

backend_image  = "saravana2002/pgagi-backend:latest"
frontend_image = "saravana2002/pgagi-frontend:latest"

backend_desired_count  = 1
frontend_desired_count = 1

backend_min_capacity  = 1
backend_max_capacity  = 3
frontend_min_capacity = 1
frontend_max_capacity = 3