# 🚀 DevOps Assignment – Production Grade Cloud Deployment

This project demonstrates a production-ready DevOps architecture deploying a FastAPI backend and Next.js frontend using:

- ✅ AWS (ECS Fargate, ALB, NAT, Autoscaling)
- ✅ GCP (MIG, Global Load Balancer, NAT)
- ✅ Modular Terraform (Multi-Environment)
- ✅ Zero Downtime Deployments
- ✅ Autoscaling (CPU-based)
- ✅ Path-Based Routing
- ✅ CI/CD Ready Structure

---

# 🏗 Architecture Overview

## AWS Architecture

- VPC (Multi-AZ)
- Public Subnets (ALB)
- Private Subnets (ECS Fargate)
- NAT Gateway (Internet access for containers)
- Application Load Balancer
- Path-based routing:
  - `/` → Frontend
  - `/api/*` → Backend
- ECS Services (Frontend + Backend)
- Auto Scaling (Target Tracking - 60% CPU)
- Rolling Deployments (Zero Downtime)

## GCP Architecture

- Custom VPC
- Private Compute Instances (MIG)
- Global HTTP Load Balancer
- Health Checks
- Cloud NAT
- Autoscaling
- Path-based routing

---

# 📁 Repository Structure
# 🚀 DevOps Assignment – Production Grade Cloud Deployment

This project demonstrates a production-ready DevOps architecture deploying a FastAPI backend and Next.js frontend using:

- ✅ AWS (ECS Fargate, ALB, NAT, Autoscaling)
- ✅ GCP (MIG, Global Load Balancer, NAT)
- ✅ Modular Terraform (Multi-Environment)
- ✅ Zero Downtime Deployments
- ✅ Autoscaling (CPU-based)
- ✅ Path-Based Routing
- ✅ CI/CD Ready Structure

---

# 🏗 Architecture Overview

## AWS Architecture

- VPC (Multi-AZ)
- Public Subnets (ALB)
- Private Subnets (ECS Fargate)
- NAT Gateway (Internet access for containers)
- Application Load Balancer
- Path-based routing:
  - `/` → Frontend
  - `/api/*` → Backend
- ECS Services (Frontend + Backend)
- Auto Scaling (Target Tracking - 60% CPU)
- Rolling Deployments (Zero Downtime)

## GCP Architecture

- Custom VPC
- Private Compute Instances (MIG)
- Global HTTP Load Balancer
- Health Checks
- Cloud NAT
- Autoscaling
- Path-based routing

---

# 📁 Repository Structure
.
├── backend/
├── frontend/
├── Infra/
│ ├── aws/
│ │ ├── modules/
│ │ └── environments/
│ │ ├── dev/
│ │ ├── staging/
│ │ └── prod/
│ └── gcp/
│ ├── modules/
│ └── environments/
│ ├── dev/
│ ├── staging/
│ └── prod/
└── README.md


---

# 🌍 Environments

Each cloud supports:

- `dev`
- `staging`
- `prod`

Managed via separate Terraform variable files.

---

# ⚙️ Infrastructure Features

| Feature | AWS | GCP |
|----------|------|------|
| Multi Environment | ✅ | ✅ |
| Modular Terraform | ✅ | ✅ |
| Private Compute | ✅ | ✅ |
| Public Load Balancer | ✅ | ✅ |
| Path Routing | ✅ | ✅ |
| Autoscaling | ✅ | ✅ |
| Zero Downtime | ✅ | ✅ |
| NAT Gateway | ✅ | ✅ |

---

# 🔁 Deployment Strategy

## Zero Downtime Rolling Deployment

ECS Configuration:

- `deployment_minimum_healthy_percent = 100`
- `deployment_maximum_percent = 200`
- Deployment circuit breaker enabled
- Health check grace period configured

This ensures no traffic interruption during deployments.

---

# 🔄 Autoscaling

Target Tracking Policy:

- Scale out when CPU > 60%
- Scale in when CPU < 60%
- Independent scaling for frontend & backend

---

# 🐳 Docker Images

- Backend: `saravana2002/pgagi-backend`
- Frontend: `saravana2002/pgagi-frontend`

---

# 🔐 Security

- Private ECS tasks
- Security groups allow only ALB traffic
- NAT gateway for outbound internet
- No public IPs for containers

---

# 🚀 CI/CD (Next Phase)

Planned CI/CD includes:

- Docker build
- Push to registry
- Automatic ECS service update
- Terraform automation

---

# 🧪 API Endpoints

Backend:

- `GET /api/health`
- `GET /api/message`

---

# 👨‍💻 Author

Saravana  
DevOps Engineer | Cloud & Automation
