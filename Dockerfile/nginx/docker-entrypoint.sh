#!/bin/bash -e
echo "Update /etc/nginx/conf.d/default.conf"
sed -i "s/http_port_here/$HTTP_PORT/g" /etc/nginx/conf.d/default.conf
sed -i "s/https_port_here/$HTTPS_PORT/g" /etc/nginx/conf.d/default.conf

# TODO: make it foreground
service php7.0-fpm start

# tail -f /dev/null
echo "nginx -g 'daemon off;'"
nginx -g 'daemon off;'
