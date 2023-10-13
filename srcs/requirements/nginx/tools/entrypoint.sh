#!/bin/bash

echo "172.18.0.2 $WP_URL" >> /etc/hosts
exec nginx -g "daemon off;"