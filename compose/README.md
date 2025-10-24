# Illuminati Project — Local Setup Guide

This guide explains how to run the full **Illuminati Project** locally using **Docker Compose**.  
The project includes multiple components: **database**, **Liquibase migrations**, **backend (Django)**, **frontend**, and **Go service**.

---

## Prerequisites

Make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/)
- Git

---

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

### 3. Clone the application repositories

In another terminal (from your preferred workspace folder):

```bash
git clone git@github.com:The-A-Team-organization/illuminati_frontend.git
git clone git@github.com:The-A-Team-organization/illuminati_backend.git
git clone git@github.com:The-A-Team-organization/illuminati_service_go.git
```

### 4. Prepare environment files

in **Django Backend** (illuminati_backend)
Create a .env file with the following:

```bash
DATABASE_HOST=host.docker.internal
DATABASE_NAME=<your_database_name>
DATABASE_USER=<your_database_user>
DATABASE_PASSWORD=<your_database_password>
DATABASE_PORT=3325

SECRET_KEY=django-insecure-secret-key
```

in **illuminati_backend\liquibase\liquibase_db.properties**
and in **illuminati_backend\liquibase\run_migrations.xml**
change path directory from **liquibase** to **changelogs**

**Go Service** (illuminati_service_go)

Prepare the .env file as described in the Go service’s own README.

**Frontend** (illuminati_frontend)

If needed, configure .env according to its README (usually for API endpoints).

### 5. Run Liquibase migrations

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

### 6. Run all services

From the root of the main compose repository:

```bash
docker compose up --build
```

This will start:

Backend

Frontend

Go service

### 7. Verification

Once everything is running:

Backend should be accessible at: http://localhost:8000

Frontend should be accessible at: http://localhost:5173

Go service (API) should respond on http://localhost:8080

### 8. Useful Commands

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
