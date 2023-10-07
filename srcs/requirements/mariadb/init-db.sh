#!/bin/bash
if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ]; then
  echo "Undefined environment variables"
  exit 1
fi

mysqld_safe &
MYSQLD_PID=$!

c=0
max_retries=30
sleep_duration=0.5

until mysqladmin ping >/dev/null 2>&1; do
  c=$((c + 1))
  echo "Waiting for database to come up... Attempt $c"
  if [ $c -ge $max_retries ]; then
    echo "Failed to connect to database. Aborting."
    exit 1
  fi
  sleep $sleep_duration
done

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"

echo "Restarting database..."

kill -TERM $MYSQLD_PID
wait $MYSQLD_PID
exec mysqld