#!/bin/bash
sudo docker run --link ckan -p 80:80 -v /etc/localtime:/etc/localtime:ro -v $(pwd)/ckan:/etc/nginx/conf.d/default.conf:ro nginx:alpine
