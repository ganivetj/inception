FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx curl

COPY nginx.conf /etc/nginx/nginx.conf

COPY certificate.pem /etc/ssl/certs/certificate.pem
COPY private_key.pem /etc/ssl/private/private_key.pem

EXPOSE 80 443

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
