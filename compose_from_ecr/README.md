# Illuminati Project — Local Setup Guide

This guide explains how to run the full **Illuminati Project** locally using **Docker Compose** pulling images for AWS ECR.  
The project includes multiple components: **database**, **Liquibase migrations**, **backend (Django)**, **frontend**, and **Go microservices**.

---

## Prerequisites

Make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)
- Git
- [AWS CLI](https://aws.amazon.com/cli/)

Additionally, you need an **AWS account** with credentials configured to access ECR:

1. Create or use an existing AWS account.
2. Generate an **Access Key ID** and **Secret Access Key** in IAM.
3. Install the AWS CLI.
4. Configure the AWS CLI with your credentials:

```bash
aws configure
```

## Steps to Run the Project

### 1. Clone the main repository

```bash
git clone git@github.com:The-A-Team-organization/illuminati_iac.git
cd compose_from_ecr
```

```bash
cp .env.example .env
```

Fill in your credentials in .env.

Go Mailer

Prepare the .env file as described in the Go service’s own README.

https://github.com/The-A-Team-organization/illuminati_email_service/blob/main/README.md

### 2. This is required so Docker can pull images from AWS ECR.

There are helper scripts included:

run-compose.ps1 for Windows

run-compose.sh for Linux/macOS

```bash
# Make the script executable
chmod 777 run-compose.sh

./run-compose.sh
```

### 4. Start

```bash
docker compose up --build
```

This will start the MariaDB container.

Liquibase will apply all migrations automatically.

Backend

Frontend

Go Mailer

Go Scheduler

### 5. Verification

Once everything is running:

Backend should be accessible at: http://localhost:8000

Frontend should be accessible at: http://localhost:5173

Go mailer (API) should respond on http://localhost:8080

### 4. Useful Commands

Stop all containers:

```bash
docker compose down
```

Check running containers:

```bash
docker ps
```
