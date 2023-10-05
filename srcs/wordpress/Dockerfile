# Use Debian Buster as base image
FROM debian:buster

RUN apt-get update && \
    apt-get install -y software-properties-common apt-transport-https lsb-release ca-certificates wget && \
    wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

RUN apt-get update && \
    apt-get install -y \
    php8.0 \
    php8.0-fpm \
    php8.0-mysql \
    php8.0-cli \
    php8.0-curl \
    php8.0-dom \
    php8.0-imagick \
    php8.0-mbstring \
    php8.0-zip \
    php8.0-gd \
    php8.0-intl \
    unzip \
    curl

COPY update_php_fpm_conf.sh /update_php_fpm_conf.sh
RUN chmod +x /update_php_fpm_conf.sh
RUN /update_php_fpm_conf.sh

WORKDIR /var
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip

COPY wp-config.php /var/wordpress/wp-config.php
RUN chmod +x /var/wordpress/wp-config.php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
