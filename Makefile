all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:
	@docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	@docker rm -f $$(docker ps -qa)
	@docker volume rm -f $$(docker volume ls)

fclean:
	make clean
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

.PHONY: all re down clean fclean