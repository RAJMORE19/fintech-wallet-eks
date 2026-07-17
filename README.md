✅ Build Order
1. architecture/
2. terraform/
3. microservices/
4. helm/
5. gitops/
6. .github/workflows/
7. docs/





# 💳 Enterprise FinTech Wallet Platform on Amazon EKS

> A production-grade, cloud-native FinTech Wallet Platform built on **Amazon EKS** using **Microservices, Terraform, GitOps, Kubernetes, and AWS Managed Services**. This project demonstrates how modern enterprises design, deploy, secure, and operate scalable financial applications on Kubernetes.

---

## 🚀 Project Highlights

* 🏗️ Enterprise-grade AWS architecture
* ☸️ Kubernetes-native microservices
* ⚡ Production-ready Amazon EKS deployment
* 🌍 Multi-AZ High Availability
* 🔄 GitOps with ArgoCD
* 🏗️ Infrastructure as Code (Terraform)
* 🔐 Zero Trust Security Model
* 📈 Auto Scaling with Karpenter & HPA
* 📊 End-to-End Observability (Prometheus, Grafana, Loki, Tempo, Mimir)
* 🚀 CI/CD using GitHub Actions
* 🔒 Image Security with Trivy & Amazon ECR Scanning
* 🔑 AWS Secrets Manager + IRSA Integration
* 🌐 ALB Ingress, Route53 & ACM
* 📦 Helm-based Kubernetes Deployments
* 💬 gRPC + Event-Driven Architecture (SNS & SQS)

---

## 🛠️ Tech Stack

### ☁️ Cloud

* Amazon Web Services (AWS)
* Amazon EKS
* VPC
* Route53
* ACM
* ALB
* IAM & IRSA
* ECR
* Aurora PostgreSQL
* ElastiCache Redis
* Secrets Manager
* SNS
* SQS

### ☸️ Kubernetes

* Amazon EKS
* Helm
* ArgoCD
* Karpenter
* HPA
* NGINX Ingress
* External Secrets
* Network Policies
* Pod Security Standards

### ⚙️ DevOps

* Terraform
* GitHub Actions
* Docker
* Trivy
* GitOps

### 📊 Monitoring

* Prometheus
* Grafana
* Loki
* Tempo
* Mimir

### 💻 Microservices

* API Gateway (Node.js)
* Wallet Service (Go)
* Payment Service (Python/FastAPI)
* Notification Service (Node.js)

---

## 🎯 Project Goals

This project simulates how a **real enterprise FinTech company** deploys and manages applications on Kubernetes by implementing:

* Production-grade infrastructure
* Secure networking
* Highly available architecture
* Enterprise CI/CD
* GitOps deployment
* Cloud-native observability
* Auto scaling
* Disaster recovery best practices
* Zero downtime deployments

---

## 📂 Repository Structure

```text
fintech-wallet-eks/
│
├── terraform/
├── gitops/
├── helm/
├── microservices/
│   ├── gateway-node/
│   ├── wallet-go/
│   ├── payment-python/
│   └── notification-node/
├── kubernetes/
├── docs/
├── scripts/
└── .github/workflows/
```

---

## 📌 Project Status

🚧 **Currently Under Development**

This repository is being built step by step following enterprise best practices. Every phase includes detailed documentation, infrastructure code, Kubernetes manifests, CI/CD pipelines, and architecture diagrams.

---

## ⭐ Why This Project?

This repository is designed to demonstrate hands-on experience with production-grade Kubernetes and AWS infrastructure, making it an ideal portfolio project for **DevOps, Cloud, Platform Engineering, and Site Reliability Engineering (SRE)** roles.

If you find this project useful, consider giving it a ⭐ to support the repository.
