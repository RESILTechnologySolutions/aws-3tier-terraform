variable "aws_region" {
  description = "AWS region where the 3-tier environment will be deployed."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name prefix used for AWS resources in this project."
  type        = string
  default     = "aws-3tier-terraform"
}

variable "vpc_cidr" {
  description = "CIDR block for the main project VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets across two Availability Zones."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_app_subnet_cidrs" {
  description = "CIDR blocks for private application subnets across two Availability Zones."
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "isolated_db_subnet_cidrs" {
  description = "CIDR blocks for isolated database subnets across two Availability Zones."
  type        = list(string)
  default     = ["10.0.21.0/24", "10.0.22.0/24"]
}
