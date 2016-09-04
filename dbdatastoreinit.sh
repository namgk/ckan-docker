#!/bin/bash
POSTGRES=ckan-postgres
SOLR=ckan-solr
dockerexec='sudo docker exec -it'
dockerrun='sudo docker run -v /etc/localtime:/etc/localtime:ro'
ckanlinkedrun="$dockerrun --rm --link $SOLR --link $POSTGRES --env-file ~/.ckan/ckan.env nhong/ckan"
postgresexec="$dockerexec -u postgres $POSTGRES"

# create datastore db and user, remember to update the password in ckan.env file
$postgresexec createuser -S -D -P -R -l datastore_default
$postgresexec createdb -O ckan_default datastore_default -E utf-8

$ckanlinkedrun ckan db init 
$ckanlinkedrun ckan datastore set-permissions | $postgresexec psql --set ON_ERROR_STOP=1
