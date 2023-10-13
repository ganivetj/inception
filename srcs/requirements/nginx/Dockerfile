FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx curl

COPY requirements/nginx/conf/nginx.conf /etc/nginx/nginx.conf

COPY certificates/certificate.pem /etc/ssl/certs/certificate.pem
COPY certificates/private_key.pem /etc/ssl/private/private_key.pem

EXPOSE 80 443

COPY requirements/nginx/tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
