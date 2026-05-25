# 🚀Inception Project
This project has been created as part of the 42 curriculum by franmore

## Description

Inception is a system administration project focused on building a secure and modular infrastructure using Docker containers.

The goal of the project is to deploy multiple services inside containers that work together to host a functional website. Each service runs in isolation but communicates through a controlled Docker network.

The main services include:
- NGINX as a secure web server
- WordPress as a content management system
- MariaDB as the database service

Additional bonus services extend the infrastructure with tools such as Redis caching, FTP access, Adminer database management, and a static website.

This project demonstrates container orchestration, service isolation, data persistence, and secure communication between services.

---

## Instructions

### Requirements
- Docker
- Docker Compose
- Make
- Linux environment or virtual machine

### Installation
1. Clone the repository:
```bash
git clone https://github.com/Fren2804/Inception.git
cd Inception
```
2. Configure the environment variables inside /srcs/.env.

3. Update volume paths in the Makefile if necessary.

4. Configure host redirection on your system:
```bash
sudo nano /etc/hosts
```
5. Add the following line:
```bash
127.0.0.1    {WP_URL}
```
6. Start the infrastructure:
```bash
make
```
7. Open the website:
```bash
https://{WP_URL}/
```
8. Stop containers:
```bash
make down
```
9. Clean the environment:
```bash
make clean_strict
```

## Project Design and Architecture
### Use of Docker

Docker allows services to run in isolated containers while sharing resources efficiently. Containers start quickly and make the infrastructure portable and reproducible.

Each service runs independently, improving modularity and maintainability.

---

### Virtual Machines vs Docker

Virtual Machines:

- Run a full operating system
- Consume more resources
- Slower startup time

Docker Containers:

- Share the host OS kernel
- Lightweight and faster
- Better suited for microservice architectures
- Docker is preferred here due to efficiency and portability.

---

### Secrets vs Environment Variables

Environment variables store configuration values directly in containers but may expose sensitive data.

Docker secrets provide safer storage for credentials, but environment variables are sufficient for the scope of this project and simplify deployment.

---

### Docker Network vs Host Network

Docker Network:

- Containers communicate internally
- Services are isolated from the host network
- Improved security

Host Network:

- Containers share the host network directly
- Less isolation and potentially less secure
- The project uses Docker networks to maintain isolation and control communication.

---

### Docker Volumes vs Bind Mounts

Docker Volumes:

- Managed by Docker
- Better portability
- Recommended for persistent container data

Bind Mounts:

- Direct mapping to host directories
- Useful for development but less portable
- Volumes are used to persist WordPress and database data across container restarts.

---

### Documentation

Docker Official Documentation — https://docs.docker.com

Docker Compose Documentation — https://docs.docker.com/compose/

NGINX Documentation — https://nginx.org

WordPress Documentation — https://wordpress.org/support/

MariaDB Documentation — https://mariadb.org/documentation/