FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    dumb-init && \
    rm -rf /var/lib/apt/lists/*

COPY init-db.sh /init-db.sh
COPY mariadb.cnf /etc/mysql/mariadb.cnf

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

RUN chmod +x /init-db.sh

EXPOSE 3306

CMD ["/init-db.sh"]
