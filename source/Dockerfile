FROM ubuntu:trusty

ARG VER=2.5
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y libpq-dev python-dev python-pip python-virtualenv git-core
RUN mkdir -p etc/ckan

RUN pip install --upgrade pip setuptools
RUN pip install testrepository html5lib==0.9999999
RUN pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.5.2#egg=ckan'
RUN pip install -r src/ckan/requirements.txt

RUN paster make-config ckan /etc/ckan/development.ini
RUN cp src/ckan/who.ini etc/ckan/who.ini

ARG SOLR_URL=http://ckan-solr:8983/solr
ARG CKAN_DB_URL=postgresql://ckan_default:password@ckan-postgres/ckan_default
ARG SITE_URL=http://bennu.magic.ubc.ca
ARG DATASTORE_WRITE_URL=postgresql://ckan_default:password@ckan-postgres/datastore_default
ARG DATASTORE_READ_URL=postgresql://datastore_default:password@ckan-postgres/datastore_default

RUN sed -i "s~^#\?solr_url\s*=\s*.*~solr_url = $SOLR_URL~" /etc/ckan/development.ini
RUN sed -i "s~^#\?sqlalchemy.url\s*=\s*.*~sqlalchemy.url = $CKAN_DB_URL~" /etc/ckan/development.ini
RUN sed -i "s~^#\?ckan.site_url\s*=\s*.*~ckan.site_url = $SITE_URL~" /etc/ckan/development.ini
RUN sed -i "s~^#\?ckan.datastore.write_url\s*=\s*.*~ckan.datastore.write_url = $DATASTORE_WRITE_URL~" /etc/ckan/development.ini
RUN sed -i "s~^#\?ckan.datastore.read_url\s*=\s*.*~ckan.datastore.read_url = $DATASTORE_READ_URL~" /etc/ckan/development.ini
RUN sed -i "s~^#\?ckan.plugins\s*=~ckan.plugins = datastore ~" /etc/ckan/development.ini

WORKDIR src/ckan
EXPOSE 5000

CMD ["paster","serve", "/etc/ckan/development.ini"]
