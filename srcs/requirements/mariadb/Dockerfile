FROM debian:buster

RUN apt-get update \
    && apt-get install -y software-properties-common gnupg \
    && apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' \
    && echo "deb [arch=amd64] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.10/debian buster main" > /etc/apt/sources.list.d/mariadb.list \
    && apt-get update \
    && apt-get install -y mariadb-server mariadb-client dumb-init

COPY init-db.sh /init-db.sh
COPY mariadb.cnf /etc/mysql/mariadb.cnf

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

RUN chmod +x /init-db.sh

EXPOSE 3306

CMD ["/init-db.sh"]
