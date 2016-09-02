FROM ubuntu:trusty

ARG VER=2.5
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y libpq-dev python-dev python-pip python-virtualenv git-core

RUN pip install --upgrade pip setuptools
RUN pip install testrepository html5lib==0.9999999
RUN pip install -e 'git+https://github.com/ckan/ckan.git@ckan-2.5.2#egg=ckan'
RUN pip install -r src/ckan/requirements.txt

RUN mkdir -p etc/ckan/default
RUN paster make-config ckan /etc/ckan/default/development.ini
RUN cp src/ckan/who.ini etc/ckan/default/who.ini

VOLUME ["/etc/ckan/default"]
WORKDIR src/ckan
EXPOSE 5000

CMD ["paster","serve", "/etc/ckan/default/development.ini"]
