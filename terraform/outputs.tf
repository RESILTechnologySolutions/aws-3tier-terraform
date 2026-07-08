output "aws_region" {
  description = "AWS region where the environment is deployed."
  value       = var.aws_region
}

output "project_name" {
  description = "Project name used for resource naming."
  value       = var.project_name
}

output "vpc_cidr" {
  description = "CIDR block assigned to the VPC."
  value       = var.vpc_cidr
}
