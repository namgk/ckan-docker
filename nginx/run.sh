#!/bin/bash
sudo docker run -v /etc/localtime:/etc/localtime:ro -v $(pwd)/ckan:/etc/nginx/conf.d/default.conf:ro nginx:alpine
