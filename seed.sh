#!/bin/bash

echo "Waiting for Opal to be ready..."
doSeed() {
  echo "Waiting for Opal to be ready..."
  while [ `opal rest -o $1 -u administrator -p password -m GET /system/databases | grep -ch "mongodb"` -eq 0 ]
  do
	echo -n "#"
	sleep 5
  done

  echo "Seeding Opal" $(date +"%F - %T")
  make seed-opal seed-datashield  database=mongodb opal_url=$1
  sleep 300
  echo "Seeding Mica" $(date +"%F - %T")
  make seed-mica mica_url=$2
  echo "Seeding Agate" $(date +"%F - %T")
  make seed-agate agate_url=$3
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/../obiba-home
doSeed http://localhost:9980 https://localhost:9945 https://localhost:9944
