############################
# Cluster Info
############################
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks.name
}

output "eks_cluster_endpoint" {
  description = "The endpoint URL of the EKS cluster"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = aws_eks_cluster.eks.version
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.eks.arn
}

############################
# Node Group Info
############################
output "eks_node_group_name" {
  description = "The name of the Node Group"
  value       = aws_eks_node_group.eks_nodes.node_group_name
}

output "eks_node_role_arn" {
  description = "The IAM role ARN used by Node Group"
  value       = aws_iam_role.eks_node_role.arn
}

############################
# IAM Roles
############################
output "eks_cluster_role_arn" {
  description = "The IAM role ARN used by the EKS cluster"
  value       = aws_iam_role.eks_cluster_role.arn
}

############################
# VPC & Subnets Info
############################
output "vpc_id" {
  description = "The ID of the VPC used by EKS"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnets used by the cluster"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "Public subnets created in the VPC"
  value       = module.vpc.public_subnets
}
