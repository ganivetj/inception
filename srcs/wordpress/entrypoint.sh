#!/bin/bash

SRC_DIR="/var/wordpress"
DEST_DIR="/var/www/html"
cp -R $SRC_DIR/* $DEST_DIR
chown -R www-data:www-data $DEST_DIR

wp config create \
	--path=$DEST_DIR \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASS \
	--dbhost=$DB_HOST \
	--force \
	--allow-root

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
exec php-fpm8.0 -F