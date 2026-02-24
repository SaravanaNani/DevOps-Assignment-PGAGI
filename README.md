# 🚀 DevOps Assignment – Multi-Cloud Production Architecture

## 📌 Overview

This project demonstrates a **production-grade DevOps architecture** deployed across:

* ☁️ AWS (ECS Fargate + ALB)
* ☁️ GCP (Compute Engine + Global Load Balancer)
* 🐳 Dockerized Frontend & Backend
* 🏗 Modular Terraform Infrastructure
* 🔁 Zero Downtime Deployments
* 📈 Autoscaling Enabled
* 🔐 Private Compute with Public Load Balancer
* 🌍 Multi-Environment Support (dev / staging / prod)

---

# 🏛 Architecture

## 🔹 AWS Architecture

* VPC (Multi-AZ)
* Public Subnets (ALB)
* Private Subnets (ECS Fargate)
* NAT Gateway (Outbound Internet)
* Application Load Balancer (Path Routing)
* ECS Fargate Services (Frontend & Backend)
* Autoscaling (CPU Based)
* Zero Downtime Rolling Deployments

Routing:

* `/` → Frontend
* `/api/*` → Backend

---

## 🔹 GCP Architecture

* Custom VPC
* Private Compute Instances (Managed Instance Groups)
* Global HTTP Load Balancer
* Backend Services
* Health Checks
* Cloud NAT
* Autoscaling
* Path-Based Routing

---

# 📁 Repository Structure

```
backend/
frontend/

Infra/
 ├── aws/
 │   ├── modules/
 │   │   ├── network/
 │   │   ├── alb/
 │   │   ├── compute/
 │   ├── environments/
 │   │   ├── dev/
 │   │   ├── staging/
 │   │   ├── prod/
 │
 ├── gcp/
 │   ├── modules/
 │   ├── environments/
```

---

# 🐳 Docker Images

| Service  | Docker Image                         |
| -------- | ------------------------------------ |
| Backend  | `saravana2002/pgagi-backend:latest`  |
| Frontend | `saravana2002/pgagi-frontend:latest` |

---

# 🔁 Zero Downtime Strategy

* Deployment min healthy percent: 100%
* Deployment max percent: 200%
* Health check grace period: 60s
* Circuit breaker enabled
* ALB health check based routing

---

# 📈 Autoscaling

ECS Services scale based on:

* Target CPU Utilization = 60%
* Configurable min / max capacity
* Separate scaling for frontend & backend

---

# 🌎 Multi-Environment Support

Each environment has:

* Separate Terraform backend
* Separate state
* Separate scaling configuration

```
dev.tfvars
staging.tfvars
prod.tfvars
```

---

# 🔐 Security Design

* ECS tasks in private subnets
* Only ALB exposed publicly
* Security group restrictions
* NAT Gateway for outbound traffic
* No public container exposure

---

# 🚀 CI/CD (Next Phase)

GitLab CI pipeline will:

1. Build Docker images
2. Push to DockerHub
3. Update ECS service
4. Optionally run Terraform apply

---

# 👨‍💻 Author

Saravana N
DevOps Engineer

---

# 📊 Status

✅ AWS Production Ready
✅ GCP Production Ready
🔄 CI/CD In Progress
🔄 Monitoring Enhancement (Optional)

---

This project demonstrates real-world production DevOps architecture.
