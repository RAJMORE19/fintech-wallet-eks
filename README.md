✅ Build Order
1. architecture/
2. terraform/
3. microservices/
4. helm/
5. gitops/
6. .github/workflows/
7. docs/

###################### 💳 Enterprise FinTech Wallet Platform on Amazon EKS ###########################

> A production-grade, cloud-native FinTech Wallet Platform built on **Amazon EKS** using **Microservices, Terraform, GitOps, Kubernetes, and AWS Managed Services**.
> This project demonstrates how modern enterprises design, deploy, secure, and operate scalable financial applications on Kubernetes.

## 🚀 Project Highlights

* 🏗️ Enterprise-grade AWS architecture * ☸️ Kubernetes-native microservices  * ⚡ Production-ready Amazon EKS deployment
* 🌍 Multi-AZ High Availability        * 🔄 GitOps with ArgoCD               * 🏗️ Infrastructure as Code (Terraform)
*                                      * 🔐 Zero Trust Security Model
* 📈 Auto Scaling with Karpenter & HPA * 📊 End-to-End Observability (Prometheus, Grafana, Loki, Tempo, Mimir)
* 🚀 CI/CD using GitHub Actions        * 🔒 Image Security with Trivy & Amazon ECR Scanning * 🔑 AWS Secrets Manager + IRSA Integration
* 🌐 ALB Ingress, Route53 & ACM        * 📦 Helm-based Kubernetes Deployments   * 💬 gRPC + Event-Driven Architecture (SNS & SQS)

############## 🛠️ Tech Stack ###############

### ☁️ Cloud

* Amazon Web Services (AWS) * Amazon EKS * VPC * Route53 * ACM
* ALB * IAM & IRSA * ECR * Aurora PostgreSQL * ElastiCache Redis
* Secrets Manager * SNS * SQS

### ☸️ Kubernetes

* Amazon EKS * Helm * ArgoCD * Karpenter * HPA * NGINX Ingress
* External Secrets * Network Policies * Pod Security Standards

### ⚙️ DevOps

* Terraform * GitHub Actions * Docker * Trivy * GitOps

### 📊 Monitoring

* Prometheus * Grafana * Loki * Tempo * Mimir

### 💻 Microservices

* API Gateway (Node.js) * Wallet Service (Go) * Payment Service (Python/FastAPI) * Notification Service (Node.js)

---

## 🎯 Project Goals

This project simulates how a **real enterprise FinTech company** deploys and manages applications on Kubernetes by implementing:

* Production-grade infrastructure * Secure networking * Highly available architecture * Enterprise CI/CD
* GitOps deployment * Cloud-native observability * Auto scaling * Disaster recovery best practices
* Zero downtime deployments

---

## 📂 Repository Structure

enterprise-wallet-platform/
│
├── README.md
├── .gitignore
│
├── 1-architecture/
│   ├── diagrams/
│   ├── aws/
│   ├── kubernetes/
│   └── decisions/
│
├── 2-terraform/
│   ├── modules/
│   │   ├── vpc/
│   │   ├── iam/
│   │   ├── eks/
│   │   ├── ecr/
│   │   ├── rds/
│   │   ├── redis/
│   │   ├── route53/
│   │   ├── acm/
│   │   ├── alb/
│   │   └── monitoring/
│   │
│   └── environments/
│       ├── dev/
│       ├── staging/
│       └── prod/
│
├── 3-microservices/
│   ├── gateway/
│   ├── wallet/
│   ├── payment/
│   └── notification/
│
├── 4-helm/
│   ├── gateway/
│   ├── wallet/
│   ├── payment/
│   └── notification/
│
├── 5-gitops/
│   ├── applications/
│   └── environments/
│       ├── dev/
│       ├── staging/
│       └── prod/
│
├── 6-.github/
│   └── workflows/
│
├── 7-docs/
│   ├── api/
│   ├── database/
│   ├── runbooks/
│   └── interview-notes/
│
└── scripts/
```
---

---
## ⭐ Why This Project?
This repository is designed to demonstrate hands-on experience with production-grade Kubernetes and AWS infrastructure, making it an ideal portfolio project for **DevOps, Cloud, Platform Engineering, and Site Reliability Engineering (SRE)** roles.If you find this project useful, consider giving it a ⭐ to support the repository.

###########################   * 🏗️ Infrastructure as Code (Terraform) ########################

=> **What is module**
   A Terraform module lets me write infrastructure code once and reuse it multiple times with different configurations for Dev, Staging, and Production.
=> **versions.tf** is the file where I specify which Terraform version and provider versions, such as AWS, Azure, or GCP, my project should use.




