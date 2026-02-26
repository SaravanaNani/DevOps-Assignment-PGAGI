<<<<<<< HEAD
# DevOps Multi-Cloud Infrastructure & CI/CD Pipeline

## 📌 Overview

This project demonstrates a production-grade multi-cloud DevOps implementation deploying:

- FastAPI Backend
- Next.js Frontend
- Infrastructure as Code (Terraform)
- Multi-environment setup (Dev, Staging, Prod)
- CI/CD using GitLab
- AWS (ECS + ALB + Auto Scaling)
- GCP (MIG + Load Balancer)
- Secure Authentication using:
  - AWS IAM
  - GCP Workload Identity Federation (OIDC)

---

## 🏗 Architecture Overview

### AWS Architecture

- VPC (Public + Private Subnets)
- NAT Gateway
- Application Load Balancer
- ECS Fargate Services
- Auto Scaling Policies
- Rolling deployments (zero downtime)

### GCP Architecture

- VPC
- Managed Instance Groups (Backend & Frontend)
- Load Balancer
- Rolling updates
- OIDC authentication via Workload Identity Federation

---

## 🌍 Environment Structure

```
Infra/
  aws/
    environments/
      dev/
      staging/
      prod/
  gcp/
    environments/
      dev/
      staging/
      prod/
```

Each environment has isolated Terraform state and configuration.

---

## 🔐 Security Model

### AWS
- IAM execution roles
- No hardcoded secrets
- Secure Docker image pulls

### GCP
- No Service Account Keys
- GitLab OIDC → GCP Workload Identity
- Temporary federated credentials

---

## 🔁 CI/CD Design

Pipeline supports:

- Infrastructure validation
- Plan & Apply (manual approval)
- Docker image build
- Rolling deployment
- Manual destroy

### Pipeline Variables

| Variable | Values |
|----------|--------|
| CLOUD | aws / gcp |
| ENVIRONMENT | dev / staging / prod |
| ACTION | infra / deploy / destroy |

---

## 🚀 Zero Downtime Deployment

### AWS
- ECS Fargate
- Rolling update strategy
- ALB health checks
- Auto scaling enabled

### GCP
- MIG rolling-action restart
- Health check validation
- Instance template update strategy

---

## 📦 Deployment Flow

### Infrastructure

```
ACTION=infra
CLOUD=aws or gcp
ENVIRONMENT=dev/staging/prod
```

Runs:
- validate
- plan
- manual apply

---

### Application Deployment

```
ACTION=deploy
```

Runs:
- Build Docker images
- Push to DockerHub
- Rolling deployment

---

### Destroy

```
ACTION=destroy
```

Manual confirmation required.

---

## 🎯 Key DevOps Concepts Demonstrated

- Modular Terraform
- Multi-cloud deployment
- Environment isolation
- CI/CD pipeline orchestration
- OIDC-based authentication
- Zero downtime deployments
- Infrastructure + Application separation
- Secure secret management
- Artifact retention
- Auto scaling policies

---

## 📹 Video Explanation Included

Video walkthrough demonstrates:

- Architecture
- CI/CD flow
- Authentication model
- Multi-environment deployment
- Zero-downtime strategy

---

## 👨‍💻 Author

Saravana L  
DevOps Engineer  
=======
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
>>>>>>> 393e473f80294539007276cd53aacaf389b1c4c1
