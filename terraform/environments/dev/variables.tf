########################################
# Base Project Configurations
########################################

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

########################################
# Network Infrastructure Inputs
########################################

variable "vpc_id" {
  description = "The ID of the VPC where EKS will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for EKS control plane and nodes"
  type        = list(string)
}

################ #######################
# Identity & Access Management (IAM)
################ #######################

variable "cluster_role_arn" {
  description = "IAM Role ARN for the EKS Cluster control plane"
  type        = string
}

variable "worker_node_role_arn" {
  description = "IAM Role ARN for the EKS Worker Node groups"
  type        = string
}

################ #######################
# EKS Cluster Configurations
################ #######################

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster"
  type        = string
  default     = "1.31"
}

################ #######################
# Worker Node Capacity Settings
################ #######################

variable "node_instance_types" {
  description = "Instance types used for EKS worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_scaling_desired" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_scaling_max" {
  description = "Maximum number of worker nodes for scaling up"
  type        = number
  default     = 4
}

variable "node_scaling_min" {
  description = "Minimum number of worker nodes for scaling down"
  type        = number
  default     = 1
}
