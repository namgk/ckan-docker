#!/bin/bash
POSTGRES=ckan-postgres
SOLR=ckan-solr
dockerrun='sudo docker run -v /etc/localtime:/etc/localtime:ro'
ckanlinkedrun="$dockerrun --rm -it --link $SOLR --link $POSTGRES --env-file $HOME/.ckan/ckan.env nhong/ckan"

if [ -z "$1" ]; then
 echo "provide the sysadmin name to add"
 exit 1
fi

$ckanlinkedrun ckan sysadmin add $1
