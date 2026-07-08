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
