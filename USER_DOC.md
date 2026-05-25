# 🚀Inception Project - User Documentation
This project has been created as part of the 42 curriculum by franmore

## Introduction
This document explains how to install, configure, and use the Inception project environment.

The goal of this project is to set up a secure and modular infrastructure using Docker containers, including services such as NGINX, WordPress, and MariaDB.

This guide is intended for users who want to deploy and run the project locally.

## Project Overview
The infrastructure consists of multiple Docker containers configured through Docker Compose. Each service runs in its own container and communicates through a dedicated Docker network.

### Mandatory Services
The main services included are:
- NGINX (web server)
- WordPress (website)
- MariaDB (database)

### Bonus Services
Additional services are included to extend the infrastructure:
- Adminer (database management interface)
- FTP server (file transfer access)
- Redis (WordPress cache service)
- Redis Commander (Redis management interface)
- Static website service

## Services Explanation

### NGINX
NGINX is a high-performance web server and reverse proxy.  
In the Inception project, NGINX acts as the entry point of the infrastructure. It receives all incoming web requests and securely serves the WordPress website using HTTPS.

NGINX runs in its own container and forwards requests to the WordPress container through the internal Docker network.

### MariaDB
MariaDB is a relational database management system compatible with MySQL.

Within the infrastructure, MariaDB stores all WordPress data, including users, pages, and site configuration. The database runs in a separate container and is accessible only to the WordPress service through the internal network.

This separation improves security and modularity.

### WordPress
WordPress is a content management system (CMS) used to create and manage websites.

In the project, WordPress runs inside a dedicated container using PHP-FPM. It processes website content and communicates with the MariaDB database to store and retrieve user data, posts, and configuration.

WordPress is not directly exposed to the internet; it is accessed only through NGINX.

## Network, Ports and Volumes

### Docker Network
All containers in the Inception project communicate through a dedicated Docker network created by Docker Compose.

This internal network allows services to communicate securely without exposing every container to the outside. Only the NGINX container is publicly accessible, while services like WordPress and MariaDB remain internal.

Communication flow:

User → NGINX → WordPress → MariaDB

This architecture improves both modularity and security.

### Ports
Ports define how services inside containers are accessed from outside the Docker environment.

In this project:
- NGINX exposes port **443** to serve the website over HTTPS.
- WordPress and MariaDB ports are not exposed publicly and are only accessible inside the Docker network.

This means external users can only access the infrastructure through NGINX, preventing direct access to the database or application containers.

### Volumes
Volumes are used to persist data even if containers are removed or rebuilt.

In the Inception project, volumes are mainly used for:

- WordPress files (website content and configuration)
- MariaDB database data

This ensures:
- Website data is not lost when containers restart.
- Database information remains persistent.
- Containers can be rebuilt safely without losing content.

Volumes are mounted from the host machine into the containers, allowing data to survive container lifecycle changes.

## Installation

### Requirements
Before starting, make sure the following tools are installed:

- Docker
- Docker Compose
- Make
- A Linux environment or virtual machine

### Setup Steps
1. Clone the repository:
```bash
git clone https://github.com/Fren2804/Inception.git
```
2. Configure environment variables by creating a .env file inside /srcs:
```bash
MYSQL_ROOT_PASSWORD=
MYSQL_DATABASE=
MYSQL_USER=
MYSQL_PASSWORD=

WP_URL=
WP_TITLE=
WP_ADMIN_USER=
WP_ADMIN_PASS=
WP_ADMIN_EMAIL=

AUX_USER=
AUX_PASSWORD=
AUX_EMAIL=

FTP_USER=
FTP_PASS=
```
3. Update the Makefile with your local directory paths used for volumes:
```bash
@mkdir -p /home/{username}/data/mariadb
@mkdir -p /home/{username}/data/wordpress

@sudo rm -rf /home/{username}/data/mariadb
@sudo rm -rf /home/{username}/data/wordpress
```
4. Configure host redirection on your system:
```bash
sudo nano /etc/hosts
```
5. Add the following line:
```bash
127.0.0.1    {WP_URL}
```
6. Build and start the containers:
```bash
make
```
7. Open the website in your browser:
```bash
https://{WP_URL}/
```
8. Access the WordPress login page:
```bash
https://{WP_URL}/wp-login.php
```

# Commands
- Open another terminal.

- Stop all containers:
```bash
make down
```
- Clean the entire environment:
```bash
make clean_strict
```
- List running containers:
```bash
docker ps
```
- List Docker images:
```bash
docker images
```
- List volumes:
```bash
docker volume ls
```
- List networks:
```bash
docker network ls
```

## Mariadb
- Access the MariaDB container:
```bash
docker exec -it mariadb sh
```
- Connect to the database:
```bash
mariadb -u {name_user|root} -p
```
- Enter password:
```bash
{MYSQL_ROOT_PASSWORD}
```
- Show databases:
```bash
show databases;
```
- Select a database:
```bash
use {name_database};
```
- Show tables:
```bash
show tables;
```
- Display table data:
```bash
select * from {name_table};
```


## Bonus - Redis
- Check Redis cache status:
```bash
docker exec -it wordpress wp redis status --allow-root
```

## Bonus - Ftp
- Connect to the FTP server:
```bash
ftp {WP_URL}
```
- Login:
```bash
{FTP_USER}
```
- Enter password
```bash
{FTP_PASS}
```
- List files:
```bash
ls
```
- Upload a file:
```bash
put {name_archive}
```

## Bonus - Static page
- Open the static website:
```bash
https://{WP_URL}/static
```

## Bonus - Adminer
- Open Adminer:
```bash
https://{WP_URL}/adminer
```
- Connect using:
```bash
mariadb
{MYSQL_DATABASE}
{MYSQL_USER}
{MYSQL_PASSWORD}
```

## Bonus - Redis commander
- Open Redis Commander:
```bash
https://{WP_URL}/redis
```
