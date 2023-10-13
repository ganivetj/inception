# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jganivet <jganivet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/05 00:46:02 by jganivet          #+#    #+#              #
#    Updated: 2023/10/13 02:18:37 by jganivet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Include the .env file if it exists
-include srcs/.env

# Export all variables to child processes.
export

# Determine the OS type
UNAME_S := $(shell uname -s)

# The 'up' target
all: up

up: 
	docker-compose --file ./srcs/docker-compose.yml up -d
ifeq ($(UNAME_S),Darwin)
	open -na "Firefox" --args "https://$(WP_URL):443"
endif
ifeq ($(UNAME_S),Linux)
	firefox -new-window "https://$(WP_URL):443" &
endif

# The 'new' target
new: clean up
ifeq ($(UNAME_S),Darwin)
	open -na "Firefox" --args "https://$(WP_URL):443"
endif
ifeq ($(UNAME_S),Linux)
	firefox -new-window "https://$(WP_URL):443" &
endif

# The 'build' target
build:
	docker-compose --file ./srcs/docker-compose.yml up --build -d
ifeq ($(UNAME_S),Darwin)
	open -na "Firefox" --args "https://$(WP_URL):443"
endif
ifeq ($(UNAME_S),Linux)
	firefox -new-window "https://$(WP_URL):443" &
endif

# The 'build-new' target
build-new: clean build
ifeq ($(UNAME_S),Darwin)
	open -na "Firefox" --args "https://$(WP_URL):443"
endif
ifeq ($(UNAME_S),Linux)
	firefox -new-window "https://$(WP_URL):443" &
endif

# The 'down' target
down:
	docker-compose --file ./srcs/docker-compose.yml down

# The 'clean' target
clean:
	docker-compose --file ./srcs/docker-compose.yml down -v
	sudo rm -rf ~/data/db_data/*
	sudo rm -rf ~/data/wordpress_data/*

.PHONY: all up new build build-new down clean
