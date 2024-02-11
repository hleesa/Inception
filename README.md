# Docker Web Server Project

## Introduction
This project is centered on system administration using Docker. It involves virtualizing several Docker images to create a personal virtual machine setup.

## Overview
- Creation of a web infrastructure using Docker containers.
- The project is to be done on a Virtual Machine.
- Containers include NGINX with TLSv1.2 or TLSv1.3, WordPress + php-fpm, MariaDB, and volumes for WordPress database and files.

## Requirements
- Use of Docker and docker-compose.
- Containers for NGINX, WordPress + php-fpm, and MariaDB.
- Configured volumes for WordPress data.
- Docker network for container communication.
- No use of ready-made Docker images, except for base Alpine/Debian.
- No hard-coded passwords; use environment variables.
- Domain name setup to point to your local IP address.

## Installation
- Use of a Makefile for setup.
- Dockerfiles for each service.
- Environment variables for configuration (stored in a .env file).

## Configuration
- Custom configuration for NGINX with TLS support.
- WordPress and MariaDB setup in separate containers.
- Network configuration for container communication.

## Security
- Credentials and sensitive data must be stored securely (e.g., in a .env file) and not included in Dockerfiles or committed to Git.
