#!/bin/bash

sudo docker run -v /etc/localtime:/etc/localtime:ro --net ckan --name ckan-solr2.8 -d nhong/solr-tomcat:2.8-schema
