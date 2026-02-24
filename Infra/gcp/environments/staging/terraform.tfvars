project_id   = "gcp-practice-486317"
region       = "asia-south1"
zone         = "asia-south1-a"

project_name = "pgagi"
environment  = "staging"

subnet_cidr = "10.0.2.0/24"

backend_machine_type  = "e2-small"
frontend_machine_type = "e2-small"

backend_min_replicas  = 1
backend_max_replicas  = 3

frontend_min_replicas = 1
frontend_max_replicas = 3