Project
Enterprise FinTech Wallet Platform on Amazon EKS

Architecture Style

Kubernetes Native
Event Driven
GitOps
Infrastructure as Code
Zero Trust
Production Ready
Highly Available
Multi AZ
Multi Environment
High Level Architecture
                Route53
                   │
             ACM SSL Certificate
                   │
          AWS Load Balancer Controller
                   │
          Application Load Balancer
                   │
          NGINX Ingress Controller
                   │
──────────────────────────────────────────
            Amazon EKS Cluster
──────────────────────────────────────────

API Gateway Service (Node.js)

        │ gRPC

──────────────────────────────────────────

Wallet Service (Go)

Payment Service (Python)

Notification Service (Node.js)

──────────────────────────────────────────

Event Bus

SNS
 │
SQS Queues

OR

Kafka (MSK)

──────────────────────────────────────────

Aurora PostgreSQL
Redis ElastiCache

──────────────────────────────────────────

Secrets Manager
IRSA
External Secrets

──────────────────────────────────────────

Prometheus
Grafana
Loki
Tempo
Mimir

──────────────────────────────────────────

ArgoCD

Terraform

GitHub Actions

ECR

Trivy

Karpenter
Microservices
1. API Gateway

Language

Node.js

Responsibilities

Authentication
JWT Validation
REST APIs
Rate Limiting
Forward gRPC requests

Communication

REST → gRPC

2. Wallet Service

Language

Go

Responsibilities

Create Wallet
Debit
Credit
Balance
Transactions

Communication

gRPC

Database

Aurora PostgreSQL

3. Payment Service

Language

Python (FastAPI)

Responsibilities

Process Payments
Fraud Checks
Publish Events

Communication

gRPC

Publishes

PaymentCompleted
PaymentFailed

SNS

4. Notification Service

Language

Node.js

Consumes

SQS

Sends

Email
SMS
Push Notification
Communication Pattern
Synchronous
Client

↓

API Gateway

↓

Wallet Service

↓

Payment Service

using

gRPC

Asynchronous
Payment Completed

↓

SNS Topic

↓

SQS Queue

↓

Notification Service

↓

Email

This is commonly used in production because services remain decoupled.

Infrastructure
Terraform Repository
terraform/

modules/

    vpc/

    eks/

    iam/

    route53/

    ecr/

    acm/

    alb/

    rds/

    elasticache/

    monitoring/

    karpenter/

    argocd/

environments/

    dev/

    staging/

    prod/
VPC Design
3 AZ

AZ-A

Public

Private

Isolated

AZ-B

Public

Private

Isolated

AZ-C

Public

Private

Isolated

Public

ALB
NAT Gateway

Private

EKS Nodes
Internal Services

Isolated

Aurora
Redis
EKS

Managed Control Plane

Managed Node Groups

System Nodes

Application Nodes

Monitoring Nodes

Later

Karpenter provisions Spot instances.

IAM

Use

IRSA

Every service gets its own IAM Role.

Example

Wallet Service

Can access

Secrets Manager

CloudWatch

S3

Nothing else.

Networking

Internet

↓

ALB

↓

NGINX Ingress

↓

Services

↓

Pods

DNS

Route53

SSL

ACM

Internal communication

ClusterIP

Load Balancer

Install

AWS Load Balancer Controller

Ingress

api.company.com

wallet.company.com

payment.company.com

Automatic

ALB
Target Groups
Listener Rules
Security

Secrets

AWS Secrets Manager

↓

ASCP CSI Driver

↓

Mounted into Pods

Never store secrets inside Git.

Image Security

Pipeline

GitHub

↓

Build

↓

Trivy Scan

↓

Push

↓

Amazon ECR Scan

↓

Deploy

Fail deployment if

Critical

High

vulnerabilities exist.

Network Policies

Use

Calico

Allow

API Gateway

↓

Wallet

Block

Notification

↓

Database

unless explicitly permitted.

Pod Security
Non Root
ReadOnly Root Filesystem
Drop Linux Capabilities
Security Context
Resource Limits
Autoscaling

Choose

Karpenter

instead of Cluster Autoscaler.

Reasons

Faster
Cheaper
Native AWS
Better Spot Support

NodePools

General

Memory

Compute

Spot
Pod Autoscaling

Metrics

Prometheus Adapter

HPA

Example

CPU

Memory

Requests/sec

Latency

Queue Length

Scale

2

↓

30 Pods

automatically.

Resilience

Pod Disruption Budget

Example

Replicas

5

Min Available

3

Rolling Update

maxUnavailable=1

maxSurge=1

Topology Spread Constraints

Distribute Pods across AZs.

Monitoring

Use

LGTM

Grafana

Loki

Tempo

Mimir

Metrics

Prometheus

Logs

Loki

Tracing

Tempo

Dashboards

Grafana

Golden Signals

Monitor

Latency

Traffic

Errors

Saturation

Additional dashboards

Node
Pod
Namespace
HPA
API
Business Metrics
Logging

Fluent Bit

↓

Loki

↓

Grafana

Every request has

TraceID

Useful for distributed tracing.

GitOps

ArgoCD

Repository

gitops/

apps/

wallet/

payment/

notification/

gateway/

environments/

dev/

staging/

prod/

Helm Structure

charts/

wallet/

payment/

notification/

gateway/

Environment Values

values-dev.yaml

values-stage.yaml

values-prod.yaml

ArgoCD automatically syncs.

CI/CD

GitHub Actions

Developer Push

↓

Unit Tests

↓

Docker Build

↓

Trivy Scan

↓

Push Image

↓

Terraform Validate

↓

Terraform Plan

↓

Terraform Apply

↓

Update Helm Version

↓

ArgoCD Sync

↓

Deploy
AWS Services Used
Category	AWS Service
Compute	Amazon EKS
Container Registry	Amazon ECR
IAM	IAM + IRSA
Storage	Amazon S3
Database	Aurora PostgreSQL
Cache	ElastiCache Redis
Secrets	Secrets Manager
DNS	Route53
Certificate	ACM
Networking	VPC
Internet	IGW
Private Internet	NAT Gateway
Load Balancer	ALB
Messaging	SNS
Queue	SQS
Monitoring	CloudWatch (optional)
Autoscaling	Karpenter
Identity	IAM Roles
Kubernetes Resources Used
Namespace
Deployment
StatefulSet
Service
ConfigMap
Secret (only non-sensitive placeholders)
ServiceAccount
Ingress
HPA
PDB
NetworkPolicy
PersistentVolumeClaim
CronJob
Job
PodMonitor
ServiceMonitor
VerticalPodAutoscaler (optional)
PriorityClass
LimitRange
ResourceQuota
Repository Layout
enterprise-wallet-platform/

terraform/

gitops/

helm/

microservices/

gateway-node/

wallet-go/

payment-python/

notification-node/

k8s/

docs/

scripts/

.github/workflows/
5-Phase Execution Roadmap
Phase 1 – Foundation (Week 1)

Deliverables:

Create VPC with 3 AZs, public/private/isolated subnets, IGW, NAT Gateways, and VPC endpoints.
Provision EKS using Terraform with Managed Node Groups, IRSA enabled, and Amazon VPC CNI.
Install core add-ons: Metrics Server, AWS Load Balancer Controller, EBS CSI Driver, ExternalDNS (Route53), and External Secrets Operator with AWS Secrets Manager.

Outcome:

A secure, production-ready Kubernetes foundation capable of hosting workloads.
Phase 2 – Core Platform Services (Week 2)

Deliverables:

Build the four microservices (Gateway, Wallet, Payment, Notification).
Implement gRPC for synchronous calls and SNS→SQS for asynchronous events.
Deploy Aurora PostgreSQL and ElastiCache Redis.
Package services as Helm charts and publish images to ECR after Trivy scanning.

Outcome:

Functional application with production-grade service communication and persistence.
Phase 3 – Traffic Management & Security (Week 3)

Deliverables:

Configure Route53, ACM certificates, ALB, and NGINX Ingress.
Integrate AWS Secrets Manager through the Secrets Store CSI Driver (ASCP).
Apply Calico NetworkPolicies, Pod Security settings, resource requests/limits, and image vulnerability gates.

Outcome:

Secure ingress, encrypted traffic, least-privilege access, and hardened workloads.
Phase 4 – Scalability & Observability (Week 4)

Deliverables:

Install Karpenter for node provisioning.
Configure HPA using Prometheus Adapter with custom metrics (e.g., request rate or queue depth).
Add PDBs and topology spread constraints.
Deploy the LGTM stack (Prometheus, Loki, Tempo, Mimir, Grafana) with dashboards for Kubernetes and application Golden Signals.

Outcome:

Highly scalable platform with deep operational visibility and resilience.
Phase 5 – GitOps & Production Operations (Week 5)

Deliverables:

Implement GitOps with ArgoCD using separate dev, staging, and prod overlays via Kustomize or environment-specific Helm values.
Create GitHub Actions pipelines for testing, image building, Trivy scanning, ECR publishing, and GitOps manifest updates.
Add rollback strategies, progressive deployment support (Argo Rollouts can be added later), backup procedures, disaster recovery documentation, and architecture diagrams.

Outcome:

An enterprise-grade delivery platform that mirrors how modern organizations manage Kubernetes in production.
Final Result

Completing this roadmap gives you a portfolio project that demonstrates practical experience with:

Enterprise VPC and EKS architecture
Terraform modular infrastructure
Multi-language microservices
gRPC and event-driven messaging
IRSA and Secrets Manager integration
ALB, Route53, ACM, and ingress management
Karpenter, HPA, and production scaling
LGTM observability with distributed tracing
GitOps using ArgoCD
CI/CD with GitHub Actions and security scanning

This scope is substantial enough to discuss for 60–90 minutes in a senior DevOps interview and showcases the technologies and operational patterns commonly expected in production Kubernetes environments.
