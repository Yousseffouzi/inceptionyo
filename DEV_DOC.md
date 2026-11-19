# Developer Documentation

## Prerequisites

The project runs inside a Linux Virtual Machine.

Required tools:

- Docker
- Docker Compose
- Make

The domain must resolve locally:

```text
127.0.0.1 yofouzi.42.fr
```

---

## Configuration

Docker Compose configuration:

```text
srcs/docker-compose.yml
```

Environment variables:

```text
srcs/.env
```

Passwords are stored in:

```text
secrets/
```

Secret files must not be committed to Git.

---

## Services

The project contains:

### Mandatory
- NGINX
- WordPress with PHP-FPM
- MariaDB

Each service runs in its own container and is built from its own Dockerfile, as required by the subject.

---

## Persistent Data

Create the required directories:

```bash
mkdir -p /home/yofouzi/data/mariadb
mkdir -p /home/yofouzi/data/wordpress
```

Persistent data is stored in:

```text
/home/yofouzi/data/mariadb
/home/yofouzi/data/wordpress
```

This allows WordPress and MariaDB data to survive container recreation.

---

## Build and Run

Start the project:

```bash
make
```

or:

```bash
make up
```

Stop:

```bash
make down
```

Full clean:

```bash
make fclean
```

Rebuild:

```bash
make re
```

---

## Manage the Infrastructure

Check containers:

```bash
docker compose -f ./srcs/docker-compose.yml ps
```

View logs:

```bash
docker compose -f ./srcs/docker-compose.yml logs
```

List volumes:

```bash
docker volume ls
```

List networks:

```bash
docker network ls
```
