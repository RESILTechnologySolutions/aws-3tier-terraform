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

output "vpc_id" {
  description = "ID of the project VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = aws_subnet.public[*].id
}

output "private_app_subnet_ids" {
  description = "IDs of the private application subnets."
  value       = aws_subnet.private_app[*].id
}

output "isolated_db_subnet_ids" {
  description = "IDs of the isolated database subnets."
  value       = aws_subnet.isolated_db[*].id
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway attached to the VPC."
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public.id
}
