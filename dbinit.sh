#!/bin/bash
POSTGRES=ckan-postgres
SOLR=ckan-solr
dockerrun='sudo docker run -v /etc/localtime:/etc/localtime:ro'
ckanlinkedrun="$dockerrun --rm --link $SOLR --link $POSTGRES --env-file ~/.ckan/ckan.env nhong/ckan"

$ckanlinkedrun ckan db init 
