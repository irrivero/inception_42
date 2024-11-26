include ./srcs/.env

all: compose

compose:
	docker compose -f ./srcs/docker-compose.yml up --build -d

create_vol:
	mkdir -p $(VOLUMES)/wordpress
	mkdir -p $(VOLUMES)/mariadb

rm_vol:
	rm -rf $(VOLUMES)

down:
	docker compose -f ./srcs/docker-compose.yml down

exec:
	docker exec -it nginx /bin/bash

logsn:
	docker compose -f ./srcs/docker-compose.yml logs nginx

logsm:
	docker compose -f ./srcs/docker-compose.yml logs mariadb

prune:
	docker system prune -af

remove_image:
	docker rmi -f nginx

test:
	start chrome https://127.0.0.1:443

testd:
	googlechrome https://irivero.42.fr:443

re: down
	make compose
	make logsm
	make test
	sleep 3
	make testd