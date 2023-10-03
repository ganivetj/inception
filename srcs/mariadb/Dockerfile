FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server

COPY init-db.sh /init-db.sh
RUN chmod +x /init-db.sh

EXPOSE 3306

ENTRYPOINT ["/init-db.sh"]
