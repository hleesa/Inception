all:
	@docker compose -f ./srcs/docker-compose.yaml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yaml down

re:
	@docker compose -f srcs/docker-compose.yaml up -d --build

clean:
	@docker rm -f $$(docker ps -qa)
	@docker volume rm -f $$(docker volume ls)

.PHONY: all re down clean