*This project has been created as part of the 42 curriculum by yofouzi.*

# Inception

## Description

Inception is a system administration project focused on Docker.

The goal is to build a small infrastructure where each service runs in its own container.

### Mandatory services

- NGINX with TLSv1.2 or TLSv1.3
- WordPress with PHP-FPM
- MariaDB
- A dedicated Docker network
- A named volume for the MariaDB database
- A named volume for the WordPress files

---

## Architecture

```text
Client
  |
  | HTTPS :443
  v
NGINX
  |
  | FastCGI :9000
  v
WordPress + PHP-FPM
  |
  | :3306
  v
MariaDB
```

NGINX is the main entry point to the mandatory infrastructure.

The containers communicate through a dedicated Docker network.


---

## Design Choices

### Virtual Machines vs Docker

A Virtual Machine runs a complete operating system with its own kernel.

Docker containers share the host kernel and isolate only the applications and their dependencies.

Virtual Machines are heavier, while containers are lighter and faster to start.

In this project, Docker runs inside a Virtual Machine.

---

### Secrets vs Environment Variables

Environment variables are used for normal configuration values such as:

```text
DOMAIN_NAME
MYSQL_DATABASE
MYSQL_USER
WP_TITLE
```

They are stored in:

```text
srcs/.env
```

Passwords are stored separately using Docker secrets and are made available inside containers through:

```text
/run/secrets/
```

Passwords are not hardcoded in Dockerfiles.

---

### Docker Network vs Host Network

The project uses a dedicated Docker bridge network.

Containers communicate using service names:

```text
nginx -> wordpress:9000
wordpress -> mariadb:3306
```

Host networking is not used.

---

### Docker Volumes vs Bind Mounts

The project uses two named volumes:

```text
mariadb_data
wordpress_data
```

They store persistent data under:

```text
/home/yofouzi/data/
```

This allows containers to be removed and recreated without losing WordPress or database data.

Bind mounts directly map a host directory into a container, while Docker volumes are managed through Docker.

---

## Instructions

Start:

```bash
make
```

Stop:

```bash
make down
```

---

## Resources

Main references used:

- Docker documentation
- Docker Compose documentation
- NGINX documentation
- MariaDB documentation
- WordPress documentation
- PHP-FPM documentation
- Debian documentation
- KodeKloud Docker Training Course for the Absolute Beginner

---

## AI Usage

AI was used to:

- explain Docker and Docker Compose concepts
- understand networking, volumes, and secrets
- understand NGINX, WordPress, PHP-FPM, MariaDB
- analyze configuration errors
- review commands and configuration choices
- help structure the documentation
