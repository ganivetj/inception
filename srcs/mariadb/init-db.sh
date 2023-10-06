#!/bin/bash
if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ]; then
  echo "Undefined environment variables"
  exit 1
fi

mysqld_safe &

until mysqladmin ping >/dev/null 2>&1; do
  echo "Waiting for database to come up..."
  sleep 1
done

mysql -e "CREATE DATABASE $DB_NAME;"
mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

wait $!