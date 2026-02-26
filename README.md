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



