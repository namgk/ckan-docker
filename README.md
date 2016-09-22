
1. Create a new network for CKAN, Solr and Postgres

 ```docker network create ckan```

2. Run Solr

 ```docker run --net ckan --name ckan-solr -d nhong/solr-tomcat```

3. Run Postgres

 ```docker run --net ckan --name ckan-postgres -e POSTGRES_PASSWORD=password -e POSTGRES_USER=ckan_default -d postgres ```
 
 this password needs to be aligned with the one in ckan.env
 
4. Prepare database

 ```docker run --net ckan --env-file ckan.env -it --rm nhong/ckan ckan db init```
 
 add a sysadmin

 ```docker run --net ckan --env-file ckan.env -it --rm nhong/ckan ckan sysadmin add <user>```

5. Run CKAN with plugin dev
 
 ```mkdir plugins```

 ```docker run --net ckan --name ckan --env-file ckan.env -p 3333:8080 -d -v $(pwd)/plugins:/src nhong/ckan```
 
 go to <http://localhost:3333>

6. Add plugin to CKAN
 
 ```docker exec -it ckan bash```

 ```inside the container> pip install -e git+http://<plugin repo>#egg=<plugin name>```
 
 ```inside the container> vi /etc/ckan/default/production.ini```
 
 find the plugin configuration line and add the plugin there

7. Restart the container
 
 ```docker stop ckan ```

 ```docker start ckan```

7. Develop the plugins in the plugins folder, this folder is mounted in the container. If there's python code, the ckan container needs to be restarted. If there's only static files like html css, just restart the web browser
