#!/bin/bash

PHP_FPM_CONF="/etc/php/7.3/fpm/pool.d/www.conf"
sed -i 's|listen = \/run\/php\/php7.3-fpm.sock|listen = 9000|g' $PHP_FPM_CONF
