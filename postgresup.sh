#!/bin/bash
if [ -z "$1" ]; then
 echo "provide username and password"
 exit 1
elif [ -z "$2" ]; then
 echo "provide username and password"
 exit 1
fi
sudo docker run  -v /etc/localtime:/etc/localtime:ro --name ckan-postgres -e POSTGRES_PASSWORD=$2 -e POSTGRES_USER=$1 -d postgres
