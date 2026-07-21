# 1. Network Foundation
module "vpc" {
  source = "../../modules/vpc"

  project_name          = var.project_name
  environment           = var.environment
  vpc_cidr              = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
}

# 2. Security & Identity
module "iam" {
  source       = "../../modules/iam"
  project_name = var.project_name
  environment  = var.environment
}

# 3. Compute Infrastructure (EKS Control Plane & Nodes)
module "eks" {
  source = "../../modules/eks"

  project_name = var.project_name
  environment  = var.environment

  # Dependency Injection from VPC Output
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids

  # Dependency Injection from IAM Output
  cluster_role_arn     = module.iam.eks_cluster_role_arn
  worker_node_role_arn = module.iam.worker_node_role_arn
}

# 4. Container Registry (Amazon ECR)
module "ecr" {
  source = "../../modules/ecr"

  project_name = var.project_name
  environment  = var.environment

  repositories = [
    "gateway-service",
    "wallet-service",
    "payment-service",
    "notification-service"
  ]
}

# 5. Database Infrastructure (Amazon Aurora PostgreSQL)
module "rds" {
  source = "../../modules/rds"

  project_name = var.project_name
  environment  = var.environment

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.database_subnet_ids

  db_username = "dbadmin"
  db_password = "ChangeMe123456!"
}

# 6. Redis Cache (ElastiCache)
module "redis" {
  source = "../../modules/redis"

  project_name = var.project_name
  environment  = var.environment

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.database_subnet_ids
}

# 7. DNS (Route53)
#module "route53" {
#  source = "../../modules/route53"
#
#  domain_name = var.domain_name
#  environment = var.environment
#}

# 8. SSL Certificate (ACM)
#module "acm" {
#  source = "../../modules/acm"
#
#  domain_name = var.domain_name
#  zone_id     = module.route53.zone_id
#}

# 9. Application Load Balancer
#module "alb" {
#  source = "../../modules/alb"
#
#  project_name = var.project_name
#  environment  = var.environment
#
#  vpc_id            = module.vpc.vpc_id
#  public_subnet_ids = module.vpc.public_subnet_ids
#  certificate_arn   = module.acm.certificate_arn
#}
