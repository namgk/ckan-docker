Steps for a running CKAN environment (steps 1-5), and with plugin development (step 5-End)

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

5. Run CKAN 

 Run the CKAN container:
 
 ```docker run --net ckan --name ckan --env-file ckan.env -p 3333:8080 -d nhong/ckan```
 
 DONE !!!
 
 If you want to develop extension with CKAN, follow these extra steps:

 Run CKAN with plugin dev (replace the above command):
 
 ```mkdir plugins```

 ```docker run --net ckan --name ckan --env-file ckan.env -p 3333:8080 -d -v $(pwd)/plugins:/src nhong/ckan```
 
 go to <http://localhost:3333>

6. Add plugin to CKAN

 clone the plugin into plugins folder in step 5.
 
 ```docker exec -it ckan bash```

 ```inside the container> cd /src/<cloned plugin>```
 
 ```inside the container> python setup.py develop ```
 
 ```inside the container> vi /etc/ckan/default/production.ini```
 
 find the plugin configuration line and add the plugin there

7. Restart the container
 
 ```docker stop ckan ```

 ```docker start ckan```
 
 or you can continue step 6.
 
 ```inside the container> apachectl restart```

7. Develop the plugins in the plugins folder, this folder is mounted in the container. If there's python code, the ckan container needs to be restarted. If there's only static files like html css, just restart the web browser

8. Troubleshoot

 ```docker exec -it ckan tail /var/log/apache2/ckan_default.error.log```
