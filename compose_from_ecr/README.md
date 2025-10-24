# Illuminati Project — Local Setup Guide

This guide explains how to run the full **Illuminati Project** locally using **Docker Compose** pulling images for AWS ECR.  
The project includes multiple components: **database**, **Liquibase migrations**, **backend (Django)**, **frontend**, and **Go service**.

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
cd compose
```

### 2. Start the database

```bash
cd compose/database
cp .env.example .env
```

Fill in your database credentials in .env.
Then run:

```bash
docker compose up --build
```

This will start the MariaDB container.

\*keep in mind - to ensures that volumes (like database data) are also removed, giving you a clean start.

```bash
docker compose down -v
```

### 3. Clone the backend repositories

In another terminal (from your preferred workspace folder):

```bash
git clone git@github.com:The-A-Team-organization/illuminati_backend.git
```

in **illuminati_backend\liquibase\liquibase_db.properties**
and in **illuminati_backend\liquibase\run_migrations.xml**
change path directory from **liquibase** to **changelogs**

### 4. Run Liquibase migrations

In a new terminal:

```bash
cd compose/liquibase
cp .env.example .env
```

Update the .env with the same database credentials you used earlier.
Then run:

```bash
docker compose up --build
```

Liquibase will apply all migrations automatically.

### 5. This is required so Docker can pull images from AWS ECR.

There are helper scripts included:

run-compose.ps1 for Windows

run-compose.sh for Linux/macOS

### 6. Prepare environment files

In a new terminal **compose_from_ecr**:

```bash
cp .env.example .env
```

**Go Service** (illuminati_service_go)

Prepare the .env file as described in the Go service’s own README.

https://github.com/The-A-Team-organization/illuminati_service_go/blob/main/README.md

**Frontend** (illuminati_frontend)

If needed, configure .env according to its README (usually for API endpoints).

### 7. Run all services

From the root of the main **compose_from_ecr** repository:

```bash
docker compose up
```

This will start:

Backend

Frontend

Go service

### 8. Verification

Once everything is running:

Backend should be accessible at: http://localhost:8000

Frontend should be accessible at: http://localhost:5173

Go service (API) should respond on http://localhost:8080

### 9. Useful Commands

Stop all containers:

```bash
docker compose down
```

Rebuild everything:

```bash
docker compose up --build --force-recreate
```

Check running containers:

```bash
docker ps
```
