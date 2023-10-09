# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jganivet <jganivet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/05 00:46:02 by jganivet          #+#    #+#              #
#    Updated: 2023/10/08 22:59:57 by jganivet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	REINSTALL=FALSE docker-compose --file ./srcs/docker-compose.yml up -d

up-new:
	REINSTALL=TRUE docker-compose --file ./srcs/docker-compose.yml up -d

build:
	REINSTALL=FALSE docker-compose --file ./srcs/docker-compose.yml up --build -d

build-new:
	REINSTALL=TRUE docker-compose --file ./srcs/docker-compose.yml up --build -d

down:
	docker-compose --file ./srcs/docker-compose.yml down

clean:
	docker-compose --file ./srcs/docker-compose.yml down -v
	sudo rm -rf ~/data/db_data
	sudo rm -rf ~/data/wordpress_data
	
.PHONY: up up-new build build-new down clean

