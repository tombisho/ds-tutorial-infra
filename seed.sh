#!/bin/bash

echo "Waiting for Opal to be ready..."
doSeed() {
  echo "Waiting for Opal to be ready..."
  while [ `opal rest -o $1 -u administrator -p datashieldtest -m GET /system/databases | grep -ch "mongodb"` -eq 0 ]
  do
	echo -n "#"
	sleep 5
  done

  echo "Seeding Opal" $(date +"%F - %T")
  make seed-opal database=mongodb opal_url=$1 rserver_home=/tmp/demo-rserver
  sleep 300
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/../ds-tutorial-seed
doSeed http://localhost:9980
cd $DIR

