#!/bin/bash
sudo docker run  -v /etc/localtime:/etc/localtime:ro --name ckan-solr -d nhong/solr-tomcat
