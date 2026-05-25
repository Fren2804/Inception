NAME = inception

#Start everything
all:
	@mkdir -p /home/franmore/data/mariadb
	@mkdir -p /home/franmore/data/wordpress
	@docker compose -f srcs/docker-compose.yml up --build

#Start everything, but run it in the second pass
run_clean:
	@mkdir -p /home/franmore/data/mariadb
	@mkdir -p /home/franmore/data/wordpress
	@docker compose -f srcs/docker-compose.yml up -d --build


down:
	@docker compose -f srcs/docker-compose.yml down

clean_strict:
	@docker compose -f srcs/docker-compose.yml down
	@docker system prune -af
	@-docker volume rm `docker volume ls -q`
	@-docker network rm `docker network ls -q`
	@sudo rm -rf /home/franmore/data/mariadb
	@sudo rm -rf /home/franmore/data/wordpress

re: clean_strict all

.PHONY: all run_clean down clean_strict re