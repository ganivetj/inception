#!/bin/bash

SRC_DIR="/var/wordpress"
DEST_DIR="/var/www/html"

cp -R $SRC_DIR/* $DEST_DIR
chown -R www-data:www-data $DEST_DIR

mkdir -p /run/php

exec /usr/sbin/php-fpm7.3 -F