#!/bin/bash
sudo docker run -v /etc/localtime:/etc/localtime:ro --link ckan-postgres --link ckan-solr --env-file ~/.ckan/ckan.env -p 3433:8080 -d nhong/ckan
