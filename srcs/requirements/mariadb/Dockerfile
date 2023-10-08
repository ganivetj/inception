FROM debian:buster

# Install prerequisites
RUN apt-get update \
    && apt-get install -y software-properties-common gnupg

# Add MariaDB key and repo
RUN apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc' \
    && echo "deb [arch=amd64] http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.6/debian buster main" > /etc/apt/sources.list.d/mariadb.list

# Update package list and install MariaDB
RUN apt-get update \
    && apt-get install -y mariadb-server mariadb-client dumb-init

# Copy configuration and scripts
COPY init-db.sh /init-db.sh
COPY mariadb.cnf /etc/mysql/mariadb.cnf

# Make script executable
RUN chmod +x /init-db.sh

# Expose MySQL/MariaDB port
EXPOSE 3306

# Entry Point
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/init-db.sh"]
