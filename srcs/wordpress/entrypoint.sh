#!/bin/bash

echo "172.18.0.3 jganivet.42.fr" >> /etc/hosts

check_env_vars() {
local required_vars=("DB_NAME" "DB_USER" "DB_PASS" "DB_HOST"
					 "WP_URL" "WP_TITLE" "WP_ADMIN_USER"
					 "WP_ADMIN_PASSWORD" "WP_ADMIN_EMAIL")
					 
for var in "${required_vars[@]}"; do
	if [ -z "${!var}" ]; then
    	echo "Error: $var is not set. Aborting."
    	exit 1
	fi
done
}

check_env_vars
SRC_DIR="/var/wordpress"
DEST_DIR="/var/www/html"
cp -R $SRC_DIR/* $DEST_DIR
chown -R www-data:www-data $DEST_DIR

echo "10.0.0.1 jganivet.42.fr" >> /etc/hosts

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
	--skip-email \
	--allow-root

wp plugin delete --all --path=$DEST_DIR --allow-root --quiet
wp_version=$(wp core version --path=$DEST_DIR --allow-root)
echo -e "\e[32mWordPress v$wp_version stack running.\e[0m"

mkdir -p /run/php
exec php-fpm8.0 -F