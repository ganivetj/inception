# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jganivet <jganivet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/05 00:46:02 by jganivet          #+#    #+#              #
#    Updated: 2023/10/12 17:21:20 by jganivet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	docker-compose --file ./srcs/docker-compose.yml up -d

new: clean up

build:
	docker-compose --file ./srcs/docker-compose.yml up --build -d

build-new: clean build

down:
	docker-compose --file ./srcs/docker-compose.yml down

clean:
	docker-compose --file ./srcs/docker-compose.yml down -v
	sudo rm -rf ~/data/db_data
	sudo rm -rf ~/data/wordpress_data

.PHONY: up new build build-new down clean
