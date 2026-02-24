project_id   = "gcp-practice-486317"
region       = "asia-south1"
zone         = "asia-south1-a"

project_name = "pgagi"
environment  = "dev"

subnet_cidr = "10.0.1.0/24"

backend_machine_type  = "e2-micro"
frontend_machine_type = "e2-micro"

backend_min_replicas  = 1
backend_max_replicas  = 2

frontend_min_replicas = 1
frontend_max_replicas = 2