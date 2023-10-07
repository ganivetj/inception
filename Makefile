# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jganivet <jganivet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/05 00:46:02 by jganivet          #+#    #+#              #
#    Updated: 2023/10/07 19:55:26 by jganivet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	docker-compose --file ./srcs/docker-compose.yml up -d

build:
	docker-compose --file ./srcs/docker-compose.yml up --build -d

down:
	docker-compose --file ./srcs/docker-compose.yml down

clean:
	docker-compose --file ./srcs/docker-compose.yml down -v
	rm -rf ~/data/db_data
	
.PHONY: up build down clean
