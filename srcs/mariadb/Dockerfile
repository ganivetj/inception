FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

COPY init-db.sh /init-db.sh
COPY mariadb.cnf /etc/mysql/mariadb.cnf

RUN chmod +x /init-db.sh

EXPOSE 3306

CMD ["/init-db.sh"]
