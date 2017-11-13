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
## Updated: Time-stamp: <2017-11-13 11:20:46>
##-------------------------------------------------------------------
set -ex
curl -I http://localhost:$WEB_PORT | grep "HTTP/1.1 200 OK"
## File: docker-entrypoint ends
