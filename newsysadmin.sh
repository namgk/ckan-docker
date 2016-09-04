#!/bin/bash
POSTGRES=ckan-postgres
SOLR=ckan-solr
dockerrun='sudo docker run -v /etc/localtime:/etc/localtime:ro'
ckanlinkedrun="$dockerrun --rm -it --link $SOLR --link $POSTGRES --env-file ~/.ckan/ckan.env nhong/ckan"

if [ -z "$1" ]; then
 echo "provide the sysadmin name to add"
 exit 1

$ckanlinkedrun ckan sysadmin add $1
