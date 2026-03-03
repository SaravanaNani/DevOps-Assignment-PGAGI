# 🚀 DevOps Multi-Cloud Infrastructure & CI/CD Pipeline

## 📌 Overview

This project demonstrates a **production-grade multi-cloud DevOps architecture** deployed across **AWS and GCP** using:

- FastAPI Backend
- Next.js Frontend
- Terraform (Infrastructure as Code)
- GitLab CI/CD
- Multi-environment setup (Dev, Staging, Prod)
- Secure authentication mechanisms (IAM & OIDC)

The focus of this implementation is scalability, security, automation, and operational reliability.

---

# 🏗 Architecture Overview

## ☁️ AWS Architecture

- VPC (Public & Private Subnets)
- Internet Gateway
- NAT Gateway
- Application Load Balancer (ALB)
- ECS Fargate Services (Frontend & Backend)
- Auto Scaling Policies (CPU-based)
- IAM Execution Roles
- Rolling deployments (Zero downtime)

### Traffic Flow
User → ALB (Public Subnet)  
ALB routes:
- `/api/*` → Backend Service  
- `/` → Frontend Service  
ECS tasks run in Private Subnets  
NAT Gateway enables outbound internet access  

---

## 🌐 GCP Architecture

- VPC
- Managed Instance Groups (Frontend & Backend)
- Instance Templates
- HTTP Load Balancer
- Health Checks
- Workload Identity Federation (OIDC)

### Traffic Flow
User → GCP Load Balancer → MIG Instances  
MIG maintains desired instance count  
Rolling restart ensures zero downtime  

---

# 🌍 Environment Structure


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


Each environment includes:
- Separate Terraform configuration
- Isolated remote state
- Unique resource naming
- Independent scaling configuration

This prevents cross-environment impact and protects production systems.

---

# 🔐 Security Model

## AWS
- IAM Execution Roles for ECS tasks
- IAM user credentials stored as **protected GitLab variables**
- No hardcoded secrets in repository
- Least privilege access policies

## GCP
- No Service Account JSON keys used
- GitLab OIDC → GCP Workload Identity Federation
- Short-lived temporary credentials
- Secure token exchange via STS

---

# ⚙️ GitLab CI/CD Setup

Pipeline is fully parameterized and controlled using variables.

## Required GitLab Variables

Navigate to:

GitLab → Settings → CI/CD → Variables

---

## 🌍 Common Variables

| Variable | Values |
|----------|--------|
| `CLOUD` | aws / gcp |
| `ENVIRONMENT` | dev / staging / prod |
| `ACTION` | infra / deploy / destroy |

---

## ☁️ AWS Variables

| Variable | Description |
|----------|------------|
| `AWS_ACCESS_KEY_ID` | IAM access key |
| `AWS_SECRET_ACCESS_KEY` | IAM secret key |
| `AWS_DEFAULT_REGION` | ap-south-1 |

> These are stored as **protected & masked variables**.

---

## 🌐 GCP Variables (OIDC Setup)

| Variable | Example |
|----------|----------|
| `GCP_PROJECT_ID` | your-project-id |
| `GCP_PROJECT_NUMBER` | 123456789012 |
| `GCP_SERVICE_ACCOUNT_EMAIL` | gitlab-sa@project.iam.gserviceaccount.com |
| `GCP_WORKLOAD_IDENTITY_PROVIDER` | projects/PROJECT_NUMBER/locations/global/workloadIdentityPools/POOL/providers/PROVIDER |

---

# 🔄 How GCP OIDC Works

1. GitLab job generates short-lived OIDC token  
2. Token is exchanged with GCP Security Token Service  
3. GCP issues temporary credentials  
4. Terraform and gcloud run securely  

No static keys are stored anywhere.

---

# 🔁 Pipeline Execution Flow

## 🏗 Infrastructure Provisioning

```
ACTION=infra
CLOUD=aws or gcp
ENVIRONMENT=dev/staging/prod
```


Runs:
- terraform validate
- terraform plan
- manual terraform apply

---

## 🚀 Application Deployment

```
ACTION=deploy
```
Runs:
- Docker image build
- Push to DockerHub
- Rolling deployment

AWS:
- ECS force new deployment

GCP:
- MIG rolling restart

---
## 🧨 Destroy Infrastructure
---

```
ACTION=destroy
```

Manual confirmation required.

---

# 🚀 Zero Downtime Strategy

## AWS
- ECS rolling updates
- ALB health checks
- Auto scaling enabled
- Multi-AZ deployment

## GCP
- MIG rolling-action restart
- Health check validation
- Auto-healing instances

---

# 🧠 Infrastructure State Management

- Remote backend storage (S3 for AWS / GCS for GCP)
- State locking enabled
- Environment-specific state isolation
- Prevents drift and concurrent modification

---

# 🛡 Worker Node & Runtime Authentication

## AWS
- ECS tasks use IAM Task Execution Role
- No credentials inside containers
- Secure image pulls from DockerHub

## GCP
- Infrastructure authenticated via OIDC
- Runtime VMs use attached Service Account
- No embedded credentials in instance templates

---

# 📊 Failure Handling Strategy

| Scenario | Handling |
|-----------|----------|
| Container crash | ECS auto-restart |
| Instance crash | MIG auto-healing |
| High CPU | Auto scaling |
| Failed deployment | Health checks block traffic |
| Network outage | Multi-AZ resilience |

---

# 🔮 Future Improvements

- Kubernetes (EKS / GKE)
- Blue-Green deployment
- Canary releases
- CDN integration
- Observability stack (Prometheus/Grafana)
- Centralized logging
- Multi-region disaster recovery

---

# 🎯 DevOps Concepts Demonstrated

- Modular Terraform architecture
- Multi-cloud deployment strategy
- Environment isolation
- CI/CD parameterization
- OIDC-based authentication
- Zero downtime deployment
- Secure secret management
- Infrastructure & application separation
- Auto scaling & health checks
- Production-grade operational thinking

---

# 👨‍💻 Author

**Saravana L**  
DevOps Engineer  
LinkedIn: https://linkedin.com/in/saravanal  

---

⭐ If you found this project interesting, feel free to connect with me!
