#!/bin/bash

#sed -i '/jganivet\.42\.fr/d' /etc/hosts
echo "172.18.0.2 jganivet.42.fr" >> /etc/hosts

exec nginx -g "daemon off;"