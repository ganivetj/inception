#!/bin/bash

mysqld_safe &

sleep 5s

mysql -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_password';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%' IDENTIFIED BY 'wp_password';"
mysql -e "FLUSH PRIVILEGES;"

wait $!
