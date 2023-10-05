#!/bin/bash

echo "***** Copying Wordpress files to volume"

SRC_DIR="/var/wordpress"
DEST_DIR="/var/www/html"
cp -R $SRC_DIR/* $DEST_DIR
chown -R www-data:www-data $DEST_DIR

sleep 5

wp core install \
	--path=$DEST_DIR \
	--url=$WP_URL \
	--title="$WP_TITLE" \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root

wp plugin delete --all --path=$DEST_DIR --allow-root

mkdir -p /run/php

exec /usr/sbin/php-fpm8.0 -F