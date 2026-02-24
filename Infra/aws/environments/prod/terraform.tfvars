region = "ap-south-1"

project_name = "pgagi"
environment  = "prod"

vpc_cidr = "10.30.0.0/16"

public_subnet_a_cidr  = "10.30.1.0/24"
public_subnet_b_cidr  = "10.30.2.0/24"
private_subnet_a_cidr = "10.30.3.0/24"
private_subnet_b_cidr = "10.30.4.0/24"

az_a = "ap-south-1a"
az_b = "ap-south-1b"

backend_port  = 8000
frontend_port = 3000

backend_cpu     = "512"
backend_memory  = "1024"
frontend_cpu    = "512"
frontend_memory = "1024"

backend_image  = "saravana2002/pgagi-backend:latest"
frontend_image = "saravana2002/pgagi-frontend:latest"

backend_desired_count  = 2
frontend_desired_count = 2

backend_min_capacity  = 2
backend_max_capacity  = 5
frontend_min_capacity = 2
frontend_max_capacity = 5