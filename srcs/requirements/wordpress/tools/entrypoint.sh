#!/bin/bash

echo "172.18.0.3 $WP_URL" >> /etc/hosts

DEST_DIR="/var/www/html"

wp core download \
	--path=$DEST_DIR \
	--version=6.3.2 \
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
	$WP_EDITOR_USER \
	$WP_EDITOR_EMAIL \
	--role=editor \
	--user_pass=$WP_EDITOR_PASSWORD \
	--allow-root

wp option update home "https://$WP_URL" --path="$DEST_DIR" --allow-root && \
wp option update siteurl "https://$WP_URL" --path="$DEST_DIR" --allow-root
wp search-replace http://$WP_URL/wp-admin/ https://$WP_URL/wp-admin/ wp_posts --path="$DEST_DIR" --allow-root
wp plugin delete --all --path=$DEST_DIR --allow-root --quiet

mkdir -p /run/php
exec php-fpm8.0 -F