# User Documentation

## Services

The project runs:

- NGINX on HTTPS port `443`
- WordPress with PHP-FPM
- MariaDB

NGINX is the main public entry point.

## Start and Stop

Start:

```bash
make
```

Stop:

```bash
make down
```

## Access

Website:

```text
https://mait-ijj.42.fr
```

WordPress admin:

```text
https://mait-ijj.42.fr/wp-admin
```

## Credentials

Configuration is stored in:

```text
srcs/.env
```

Passwords are stored in:

```text
secrets/
```

## Check Services

```bash
docker compose -f ./srcs/docker-compose.yml ps
```

Check logs:

```bash
docker compose -f ./srcs/docker-compose.yml logs
```

Persistent data is stored under:

```text
/home/mait-ijj/data/
```