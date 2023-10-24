NAME		= 	inception
GREEN		= 	\033[0;32m
BIG			= 	\033[0;1m
RESET		= 	\033[0m

all		:
	docker compose -f srcs/docker-compose.yaml up --build  -d
	@echo "$(GREEN)\nCompilation $(NAME) terminé\nLe site est pret (enfin dans 10 secondes)!\n$(RESET)"

clean	:
	docker compose -f srcs/docker-compose.yaml down
	@echo "$(GREEN)\nLes conteneurs sont down !\n$(RESET)"

fclean	:
	@docker compose -f srcs/docker-compose.yaml down -v
	@echo "$(GREEN)\nLes volumes ont bien été supprimés !\n$(RESET)"
	rm -rf /home/sam-acer/data/wordpress/*;
	rm -rf /home/sam-acer/data/mariadb/*;


re		:	clean all

.PHONY: all clean fclean re
