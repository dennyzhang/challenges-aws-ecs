#!/usr/bin/env bash
##-------------------------------------------------------------------
## @copyright 2017 DennyZhang.com
## Licensed under MIT 
##   https://www.dennyzhang.com/wp-content/mit_license.txt
##
## File: docker-entrypoint.sh
## Author : Denny <https://www.dennyzhang.com/contact>
## Description :
## --
## Created : <2017-11-13>
## Updated: Time-stamp: <2017-11-25 14:07:56>
##-------------------------------------------------------------------
set -ex
# curl -I http://localhost:$HTTP_PORT | grep "HTTP/1.1 200 OK"

echo "Update /etc/nginx/conf.d/default.conf"
sed -i "s/http_port_here/$HTTP_PORT/g" /etc/nginx/conf.d/default.conf
sed -i "s/https_port_here/$HTTPS_PORT/g" /etc/nginx/conf.d/default.conf

# tail -f /dev/null
echo "nginx -g 'daemon off;'"
nginx -g 'daemon off;'
## File: docker-entrypoint ends
