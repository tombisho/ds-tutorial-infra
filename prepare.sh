#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
/usr/local/bin/docker-compose stop -t 60
#/usr/local/bin/docker-compose rm --all -f -v
rm -rf /tmp/demo-*

COMPOSE_HTTP_TIMEOUT=600 /usr/local/bin/docker-compose up -d
