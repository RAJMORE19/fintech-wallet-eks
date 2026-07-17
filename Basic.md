
https://www.figma.com/  = to create images 

====================================================================== **Route 53** ==================================================================================

**Route 53** = AWS DNS Service : It converts a domain name into an IP address so users can reach your application.++
**User types**: www.myapp.com => Amazon Route 53 =>  Finds IP Address => 54.12.34.56 (EC2/Load Balancer) => EKS / EC2 / ECS => Your Website Opens
**Common DNS Records**
**Record**	     **Purpose**
A	               Domain→ IPv4 address
AAAA	           Domain → IPv6 address
CNAME	           Domain → Another domain
MX	             →Mail server
TXT	             →SPF, DKIM, Domain verification
NS	             →Name servers for the domain

======================================================================= **ACM SSL Certificate** =================================================================================

**AWS Certificate Manager (ACM)** is an AWS service that creates, manages, and automatically renews SSL/TLS certificates for your applications.
**SSL Certificate** = Encrypts data between the user's browser and your server (HTTPS).
Without SSL Browser ─────────► Website (HTTP - Plain Text ❌)
With ACM SSL Browser 🔒══════► Website (HTTPS - Encrypted ✅)

**Why do we use ACM?**
🔒 Enables HTTPS (secure connection). 🛡️ Encrypts sensitive data (passwords, payment details).
🔄 Automatically renews certificates. 💰 Free when used with supported AWS services.
✅ Trusted by all modern browsers.

**AWS Services that work with ACM**
• Application Load Balancer (ALB) • Network Load Balancer (TLS)
• CloudFront • API Gateway • Elastic Beanstalk

**Note**:
ACM certificates cannot be directly installed on EC2 instances. If you need a certificate directly on EC2, you typically use a certificate from another provider (such as Let's Encrypt or a commercial CA), unless the traffic is terminated at an AWS service like an ALB.

====================================================================== **AWS Load Balancer Controller** ==================================================================================

AWS Load Balancer Controller is a Kubernetes controller that automatically creates and manages AWS Application Load Balancers (ALB) and Network Load Balancers (NLB) for applications running on Amazon EKS.
It watches Kubernetes Ingress and Service resources and automatically provisions the required AWS Load Balancer.
Why do we use AWS Load Balancer Controller?

• Automatically creates and manages ALB/NLB.
• Exposes EKS applications to the internet or internal users.
• Routes traffic to the correct Kubernetes Services and Pods.
• Performs health checks and sends traffic only to healthy Pods.
• Supports HTTPS using AWS Certificate Manager (ACM).
• Supports host-based and path-based routing with ALB.
• Integrates with AWS Security Groups, VPC, and Target Groups.
• Automatically updates load balancer configuration when Kubernetes resources change.
• Eliminates manual load balancer management.

Flow:User -> ALB / NLB -> AWS Load Balancer Controller -> Ingress / Service -> EKS Cluster -> Pods

Supported Kubernetes Resources

• Ingress → Application Load Balancer (ALB)
• Service (Type: LoadBalancer) → Network Load Balancer (NLB)

AWS Services Used

• Amazon EKS
• Application Load Balancer (ALB)
• Network Load Balancer (NLB)
• AWS Certificate Manager (ACM)
• Amazon VPC
• Security Groups
• Target Groups
• IAM Roles for Service Accounts (IRSA)

Interview Answer (20 Seconds)

"The AWS Load Balancer Controller is a Kubernetes controller for Amazon EKS that automatically creates and manages AWS Application Load Balancers (ALB) and Network Load Balancers (NLB) based on Kubernetes Ingress and Service resources. It securely routes traffic to Kubernetes applications and integrates with AWS networking and ACM for HTTPS."

One-Line Memory Trick

AWS Load Balancer Controller = Automatically connects Amazon EKS applications to AWS ALB/NLB.

====================================================================== **Appliation load balancer ABL (Nginx ingress Contoller)** ==================================================================================

Application Load Balancer (ALB) is an AWS Layer 7 (HTTP/HTTPS) Load Balancer that receives traffic from users.
NGINX Ingress Controller is a Kubernetes controller that routes incoming traffic to the correct Kubernetes Service and Pods based on Ingress rules.

Why do we use ALB + NGINX Ingress Controller?

🌐 Exposes Kubernetes applications to the internet.
⚖️ Distributes traffic across multiple Pods.
🎯 Supports host-based and path-based routing.
🔒 Enables HTTPS using SSL/TLS certificates.
🔄 Routes traffic only to healthy Pods.
🚀 Allows multiple applications to share a single Load Balancer.
📈 Provides high availability and scalability.

Flow: User -> Application Load Balancer (ALB) -> NGINX Ingress Controller -> Ingress -> Service -> Pods

"Application Load Balancer receives HTTP/HTTPS traffic from users. NGINX Ingress Controller reads Kubernetes Ingress rules and routes the traffic to the correct Service and Pods. Together, they provide secure, scalable, and highly available traffic management for Kubernetes applications."

One-Line Memory Trick

ALB = Entry point from the Internet.
NGINX Ingress Controller = Traffic router inside Kubernetes.


====================================================================== **EKS** ==================================================================================









































