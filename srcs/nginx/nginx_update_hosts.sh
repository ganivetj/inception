#!/bin/bash

# Loop until the file is found
while [ ! -f /var/www/html/readme.html ]; do
  echo "Waiting for readme.html to be created..."
  sleep 5  # wait for 5 seconds before checking again
done

echo "index.php found. Proceeding to start NGINX"

