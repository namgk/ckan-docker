FROM ubuntu:trusty

ARG VER=2.5
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y nginx apache2 libapache2-mod-wsgi libpq5
RUN apt-get install -y wget
RUN wget http://packaging.ckan.org/python-ckan_$VER-trusty_amd64.deb
RUN dpkg -i python-ckan_2.5-trusty_amd64.deb

RUN apt-get install -y vim expect 

ARG SOLR_HOST=http://ckan-solr:8983/solr
ARG POSTGRES_HOST=ckan-postgres
ARG POSTGRES_USER=ckan_default
ARG POSTGRES_DB=ckan_default
ARG POSTGRES_PASS=password
ARG POSTGRES_URL=postgresql://$POSTGRES_USER:$POSTGRES_PASS@$POSTGRES_HOST/$POSTGRES_DB
ARG CKAN_URL=http://bennu.magic.ubc.ca

RUN sed -i "s~^#\?solr_url\s*=\s*.*~solr_url = $SOLR_HOST~" /etc/ckan/default/production.ini
RUN sed -i "s~^#\?sqlalchemy.url\s*=\s*.*~sqlalchemy.url = $POSTGRES_URL~" /etc/ckan/default/production.ini
RUN sed -i "s~^#\?ckan.site_url\s*=\s*.*~ckan.site_url = $CKAN_URL~" /etc/ckan/default/production.ini

RUN printf '#!/bin/bash\n \
cd /usr/lib/ckan/default/src/ckan\n \
/usr/lib/ckan/default/bin/paster sysadmin add $1 -c /etc/ckan/default/production.ini\n' >> newsysadmin.sh

RUN chmod +x *.sh
RUN rm *.deb

EXPOSE 8080
VOLUME ["/etc/ckan/default","/etc/apache2","/var/log/apache2","/var/log/ckan"]

CMD ["apache2ctl", "-D","FOREGROUND"] 
