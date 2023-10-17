# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jganivet <jganivet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/05 00:46:02 by jganivet          #+#    #+#              #
#    Updated: 2023/10/17 11:43:57 by jganivet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

-include srcs/.env
export

all: up

up: 
	docker-compose --file ./srcs/docker-compose.yml up -d
	sh srcs/requirements/tools/healthcheck.sh

build: 
	docker-compose --file ./srcs/docker-compose.yml up --build -d
	sh srcs/requirements/tools/healthcheck.sh
	
down:
	docker-compose --file ./srcs/docker-compose.yml down

clean:
	docker-compose --file ./srcs/docker-compose.yml down -v
	sudo rm -rf ~/data/db_data/*
	sudo rm -rf ~/data/wordpress_data/*

.PHONY: all up down clean
