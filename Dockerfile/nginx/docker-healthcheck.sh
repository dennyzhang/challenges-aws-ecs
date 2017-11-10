#!/bin/bash -ex
curl -I http://localhost:$HTTP_PORT | grep "HTTP/1.1 200 OK"
