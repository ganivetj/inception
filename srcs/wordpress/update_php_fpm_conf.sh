#!/bin/bash
PHP_FPM_CONF="/etc/php/8.0/fpm/pool.d/www.conf"
sed -i 's|listen = \/run\/php\/php8.0-fpm.sock|listen = 9000|g' $PHP_FPM_CONF