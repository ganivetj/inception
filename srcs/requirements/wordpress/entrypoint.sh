#!/bin/bash

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

echo "172.18.0.3 $WP_URL" >> /etc/hosts

DEST_DIR="/var/www/html"

wp core download \
	--path=$DEST_DIR \
	--version=6.3.1 \
	--allow-root

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
	--skip-email \
	--allow-root

wp user create \
	--path=$DEST_DIR \
	wp_editor \
	editor@42.fr \
	--role=editor \
	--user_pass=editor \
	--allow-root

wp option update home "https://$WP_URL" --path="$DEST_DIR" --allow-root && \
wp option update siteurl "https://$WP_URL" --path="$DEST_DIR" --allow-root

wp plugin delete --all --path=$DEST_DIR --allow-root --quiet
wp_version=$(wp core version --path=$DEST_DIR --allow-root)
echo -e "\e[32mWordPress v$wp_version stack running.\e[0m"

mkdir -p /run/php
exec php-fpm8.0 -F