#!/bin/bash
sudo docker run  -v /etc/localtime:/etc/localtime:ro --rm --link ckan-postgres --env-file ~/.ckan/ckan.env nhong/ckan ckan db init 
