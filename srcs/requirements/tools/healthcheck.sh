#!/bin/bash

echo "Waiting for WordPress to come up..."

max_retries=24
sleep_duration=5
c=0

status_code=0

until [ "$status_code" -eq 200 ]; do
      c=$((c + 1))
      
      if [ $c -ge $max_retries ]; then
        echo "Failed to connect to WordPress. Aborting."
        exit 1
      fi
      
      sleep $sleep_duration
      status_code=$(curl -I -k https://$WP_URL 2>/dev/null | awk 'NR==1{print $2}')
done

OS_TYPE=$(uname)

if [ "$OS_TYPE" == "Darwin" ]; then
  open -na "Firefox" --args "https://$WP_URL"
elif [ "$OS_TYPE" == "Linux" ]; then
  firefox "https://$WP_URL" &
fi
