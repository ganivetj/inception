FROM debian:buster

RUN apt-get update
RUN apt-get install -y wget unzip php php-fpm php-mysql php-cli

COPY update_php_fpm_conf.sh /update_php_fpm_conf.sh
RUN chmod +x /update_php_fpm_conf.sh
RUN /update_php_fpm_conf.sh

WORKDIR /var
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
