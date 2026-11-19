COMPOSE = docker compose -f ./srcs/docker-compose.yml

DATA_DIR = /home/yofouzi/data
MARIADB_DIR = $(DATA_DIR)/mariadb
WORDPRESS_DIR = $(DATA_DIR)/wordpress

all: up

up:
	mkdir -p $(MARIADB_DIR)
	mkdir -p $(WORDPRESS_DIR)
	$(COMPOSE) up -d

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down

fclean:
	$(COMPOSE) down --volumes --rmi all
	sudo rm -rf $(MARIADB_DIR) $(WORDPRESS_DIR)

re: fclean all

.PHONY: all up down clean fclean re