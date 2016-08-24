FROM ubuntu:trusty

ARG VER=2.5
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget nginx apache2 libapache2-mod-wsgi libpq5
RUN wget http://packaging.ckan.org/python-ckan_$VER-trusty_amd64.deb
RUN dpkg -i python-ckan_2.5-trusty_amd64.deb

ARG SOLR_URL=http://ckan-solr:8983/solr
ARG POSTGRES_URL=postgresql://ckan_default:password@ckan-postgres/ckan_default
ARG SITE_URL=http://bennu.magic.ubc.ca

RUN sed -i "s~^#\?solr_url\s*=\s*.*~solr_url = $SOLR_URL~" /etc/ckan/default/production.ini
RUN sed -i "s~^#\?sqlalchemy.url\s*=\s*.*~sqlalchemy.url = $POSTGRES_URL~" /etc/ckan/default/production.ini
RUN sed -i "s~^#\?ckan.site_url\s*=\s*.*~ckan.site_url = $SITE_URL~" /etc/ckan/default/production.ini

RUN rm *.deb

EXPOSE 8080
VOLUME ["/etc/ckan/default","/etc/apache2","/var/log/apache2"]

COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
