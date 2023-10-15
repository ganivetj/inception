#!/bin/bash

mkdir -p /run/mysqld/
ln -s /var/lib/mysql/mysql.sock /run/mysqld/mysqld.sock

if [ ! "$(ls -A /var/lib/mysql)" ] || [ "$REINSTALL" = "TRUE" ]; then
    echo "db_data volume is empty or REINSTALL=TRUE, will install new."
    REINSTALL=TRUE
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
    mysqld --user=mysql --socket=/var/lib/mysql/mysql.sock &
    MYSQLD_PID=$!

    c=0
    max_retries=30
    sleep_duration=0.5

    until echo 'SELECT 1' | mysql -uroot --socket=/var/lib/mysql/mysql.sock &> /dev/null; do
      c=$((c + 1))
      echo "Waiting for database to come up... Attempt $c"
      if [ $c -ge $max_retries ]; then
        echo "Failed to connect to database. Aborting."
        exit 1
      fi
      sleep $sleep_duration
    done

    mysql -uroot --socket=/var/lib/mysql/mysql.sock -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
    mysql -uroot --socket=/var/lib/mysql/mysql.sock -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';"
    mysql -uroot --socket=/var/lib/mysql/mysql.sock -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
    mysql -uroot --socket=/var/lib/mysql/mysql.sock -e "FLUSH PRIVILEGES;"

    echo "Restarting database, please wait"
    mysqladmin -uroot --socket=/var/lib/mysql/mysql.sock shutdown
fi
exec mysqld --user=mysql --socket=/var/lib/mysql/mysql.sock
