# AWS 3-Tier Terraform Environment

Production-style AWS 3-tier environment built with Terraform.

This project is part of the RESIL Technology Solutions cloud engineering portfolio. The goal is to demonstrate secure, documented, infrastructure-as-code deployment of a multi-tier AWS environment.

## Current Phase

Phase 1: Networking foundation

## Architecture So Far

The environment currently includes:

- 1 VPC using CIDR block `10.0.0.0/16`
- 2 public subnets across 2 Availability Zones
- 2 private application subnets across 2 Availability Zones
- 2 isolated database subnets across 2 Availability Zones
- 1 Internet Gateway
- 1 NAT Gateway
- Public route table associated with public subnets
- Private application route table associated with private app subnets
- Isolated database route table associated with isolated DB subnets

## Network Design

### Public Subnets

Public subnets are intended for public-facing infrastructure such as:

- Application Load Balancer
- NAT Gateway

The public route table sends internet-bound traffic to the Internet Gateway.

    Public subnet -> Public route table -> Internet Gateway -> Internet

### Private Application Subnets

Private application subnets are intended for the future ECS Fargate application.

Resources in these subnets should not receive public IP addresses. Outbound internet access goes through the NAT Gateway.

    Private app subnet -> Private app route table -> NAT Gateway -> Internet Gateway -> Internet

### Isolated Database Subnets

Isolated database subnets are intended for the future RDS PostgreSQL database.

These subnets do not have a route to the Internet Gateway or NAT Gateway.

    Isolated DB subnet -> Isolated DB route table -> No internet route

## NAT Gateway Cost Decision

This project currently uses 1 NAT Gateway to reduce cost while still demonstrating private subnet outbound internet access.

A higher-availability production design would use 2 NAT Gateways, one per Availability Zone, with separate private route tables routing each private subnet to the NAT Gateway in the same Availability Zone.

Tradeoff:

- 1 NAT Gateway: lower cost, less availability
- 2 NAT Gateways: higher availability, higher cost

The NAT Gateway is billable hourly and also charges for data processed. Because of this, the environment should be destroyed when not actively being tested.

## Current Cost Notes

Most networking resources in this phase are free, including:

- VPC
- Subnets
- Route tables
- Route table associations
- Internet Gateway

The current billable resource is:

- NAT Gateway

## Terraform Safety Rule

Always review:

    terraform plan

Before running:

    terraform apply

To stop ongoing AWS costs after testing:

    terraform destroy