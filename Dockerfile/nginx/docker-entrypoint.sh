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
## Updated: Time-stamp: <2019-04-15 10:48:42>
##-------------------------------------------------------------------
set -ex
# curl -I http://localhost:$HTTP_PORT | grep "HTTP/1.1 200 OK"

echo "Update /etc/nginx/conf.d/default.conf"
if grep http_port_here /etc/nginx/conf.d/default.conf; then
    sed -i "s/http_port_here/$HTTP_PORT/g" /etc/nginx/conf.d/default.conf
fi

if grep https_port_here /etc/nginx/conf.d/default.conf; then
    sed -i "s/https_port_here/$HTTPS_PORT/g" /etc/nginx/conf.d/default.conf
fi

# tail -f /dev/null
echo "nginx -g 'daemon off;'"
nginx -g 'daemon off;'
## File: docker-entrypoint ends
