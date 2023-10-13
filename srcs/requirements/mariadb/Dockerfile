FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y software-properties-common gnupg

RUN apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' \
    && echo "deb [arch=amd64] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.6/debian bullseye main" > /etc/apt/sources.list.d/mariadb.list

RUN apt-get update \
    && apt-get install -y mariadb-server mariadb-client dumb-init

COPY requirements/mariadb/tools/init-db.sh /init-db.sh
COPY requirements/mariadb/conf/mariadb.cnf /etc/mysql/mariadb.cnf

RUN chmod +x /init-db.sh

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/init-db.sh"]
