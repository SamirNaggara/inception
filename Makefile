NAME		= 	inception
GREEN		= 	\033[0;32m
BIG			= 	\033[0;1m
RESET		= 	\033[0m
DATA_PATH	= /home/snaggara/data

all		:
	@sudo mkdir -p $(DATA_PATH)/wordpress;
	@sudo mkdir -p $(DATA_PATH)/mariadb
	@echo "Les dossiers wordpress et mariadb dans $(DATA_PATH) ont bien été créé s'ils ne l'étaient pas deja"
	@sudo docker compose -f srcs/docker-compose.yaml up --build  -d
	@echo "$(GREEN)\Création des dockers terminés\nLe site est pret (enfin dans 10 secondes)!\n$(RESET)"

down	:
	@sudo docker compose -f srcs/docker-compose.yaml down
	@echo "$(GREEN)\nLes conteneurs sont down !\n$(RESET)"

fclean	:
	@sudo docker compose -f srcs/docker-compose.yaml down -v
	@echo "$(GREEN)\nLes volumes ont bien été supprimés !$(RESET)"
	@sudo rm -rf $(DATA_PATH)/wordpress;
	@sudo rm -rf $(DATA_PATH)/mariadb;
	@echo "$(GREEN)\nLes dossiers dans $(DATA_PATH) ont bien été supprimés\n$(RESET)"



re		:	down all

.PHONY: all clean fclean re
