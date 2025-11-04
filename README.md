# README

## Illuminati Infrastructure as Code (IaC)

This repository defines and provisions the complete cloud infrastructure for the Illuminati system using Terraform.
It manages all foundational resources required to deploy and run the platform’s services in a consistent, automated and secure manner.

## Overview

The repository encapsulates infrastructure configuration for the following core layers:

### 1. VPC

Defines the Virtual Private Cloud (VPC) for the Illuminati environment.

### 2. Network

Manages all networking components:

- Public and private subnets
- Internet gateway
- Routing tables
- Security groups for inbound and outbound traffic control

### 3. ECR

Manages private ECR repositories used to store container images for backend, frontend and services.
Each repository is versioned and integrated into the CI/CD pipeline.
Reference: see the compose_from_ecr README for usage details.

### 4. Jenkins

Provisions a Jenkins server for CI/CD automation.
Handles infrastructure image builds and test runs.

### 5. SonarQube

Deploys a SonarQube instance used for static code analysis and quality metrics collection.

### 6. Users Setup

Manages IAM user creation and permissions to ensure secure and role-based access to AWS resources.

### 7. Terraform State

Stores and manages Terraform state in S3 for consistency across team members.
Includes locking to prevent concurrent modifications.

## Core Technologies

- Terraform → Infrastructure as Code
- Docker Compose → Local infrastructure simulation
- AWS Services → VPC, EC2, ECR, IAM, S3, and others
- Jenkins → Continuous Integration & Deployment
- SonarQube → Code quality and security scanning
- Liquibase → Database version control

## Security and Compliance

- Uses .gitleaks for secret scanning
- Pre-commit hooks ensure consistent formatting and validation
- CSpell for codebase spell checking

## Infrastructure Context

Illuminati IaC is part of a multi-service ecosystem managed with Terraform and Docker.

- [illuminati_backend](https://github.com/The-A-Team-organization/illuminati_backend) → REST API & business logic (Python)
- [illuminati_email_service](https://github.com/The-A-Team-organization/illuminati_email_service) → Email delivery and password reset microservice (Go)
- [illuminati_scheduler_service](https://github.com/The-A-Team-organization/illuminati_scheduler_service) → Scheduled automation service (Go)
- [illuminati_iac](https://github.com/The-A-Team-organization/illuminati_iac)(This repository) → Infrastructure (Terraform, Docker)
- [illuminati_frontend](https://github.com/The-A-Team-organization/illuminati_frontend) → the user interface (React)
