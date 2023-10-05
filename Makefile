# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jganivet <jganivet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/05 00:46:02 by jganivet          #+#    #+#              #
#    Updated: 2023/10/05 01:02:26 by jganivet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	docker-compose up

build:
	docker-compose up --build
	
down:
	docker-compose down

clean:
	docker-compose down -v

.PHONY: up down clean
