#!/bin/bash

# PRE-REQUISITES:
#     a postgres container named ckan-postgres, default db named ckan_default with default user named ckan_default running
#     a solr container named ckan-solr running

POSTGRES=ckan-postgres
SOLR=ckan-solr

# Some aliases
dockerexec='sudo docker exec -it'
dockerrun='sudo docker run -v /etc/localtime:/etc/localtime:ro'
ckanlinkedrun="$dockerrun --rm --link $SOLR --link $POSTGRES --env-file $HOME/.ckan/ckan.env nhong/ckan"
postgresexec="$dockerexec -u postgres $POSTGRES"

# create datastore user, will prompt for password
# remember to update the password in ckan.env file
$postgresexec createuser -S -D -P -R -l datastore_default

# create datastore db, owned by ckan_default user
$postgresexec createdb -O ckan_default datastore_default -E utf-8

# create ckan schema, note: datastore db doesn't have a schema
$ckanlinkedrun ckan db init 

# set permissions for datastore db
$ckanlinkedrun ckan datastore set-permissions | $postgresexec psql --set ON_ERROR_STOP=1
