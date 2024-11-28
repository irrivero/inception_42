include ./srcs/.env

all: compose

compose:
	docker compose -f ./srcs/docker-compose.yml up --build -d

create_vol:
	mkdir -p $(VOLUMES)/wordpress
	mkdir -p $(VOLUMES)/mariadb

rm_vol:
	sudo rm -rf $(VOLUMES)

socket:
	sudo usermod -aG docker $(whoami)

restart_socket:
	newgrp docker

down:
	docker compose -f ./srcs/docker-compose.yml down

exec_nginx:
	docker exec -it nginx /bin/bash
	
exec_mariadb:
	docker exec -it mariadb /bin/bash

logsn:
	docker compose -f ./srcs/docker-compose.yml logs nginx

logsm:
	docker compose -f ./srcs/docker-compose.yml logs mariadb

prune:
	docker system prune -af

remove_image:
	docker rmi -f nginx

re: down
	make compose
	make logsm
	make test
	sleep 3
