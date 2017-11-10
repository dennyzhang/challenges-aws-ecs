#!/bin/bash -ex
curl -I http://localhost:$WEB_PORT | grep "HTTP/1.1 200 OK"
