#!/bin/bash

sudo docker run -v /etc/localtime:/etc/localtime:ro --net ckan --name ckan-test2.8 -it --rm -v $(pwd):/ckan-plugins nhong/ckan-plugindev:2.8-xenial
