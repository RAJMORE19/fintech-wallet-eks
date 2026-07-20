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

  # Dependency Injection from IAM Output (Dono Roles Pass Kar Diye)
  cluster_role_arn     = module.iam.eks_cluster_role_arn
  worker_node_role_arn = module.iam.worker_node_role_arn
}
