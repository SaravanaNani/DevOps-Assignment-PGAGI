project_id   = "gcp-practice-486317"
region       = "asia-south1"
zone         = "asia-south1-a"

project_name = "pgagi"
environment  = "prod"

subnet_cidr = "10.0.3.0/24"

backend_machine_type  = "e2-medium"
frontend_machine_type = "e2-medium"

backend_min_replicas  = 2
backend_max_replicas  = 5

frontend_min_replicas = 2
frontend_max_replicas = 5