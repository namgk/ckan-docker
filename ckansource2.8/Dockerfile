FROM ubuntu:xenial

ARG VER=2.8.0
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y libpq-dev python-dev python-pip python-virtualenv git-core

RUN pip install --upgrade pip setuptools
RUN pip install testrepository html5lib==0.9999999
RUN echo $VER
RUN pip install -e "git+https://github.com/ckan/ckan.git@ckan-$VER#egg=ckan"
RUN pip install -r src/ckan/requirements.txt

RUN mkdir -p etc/ckan/default
RUN paster make-config ckan /etc/ckan/default/development.ini
RUN cp src/ckan/who.ini etc/ckan/default/who.ini
RUN mkdir /ckan-plugins

VOLUME ["/etc/ckan/default", "/ckan-plugins"]
WORKDIR src/ckan
EXPOSE 5000

CMD ["paster","serve", "/etc/ckan/default/development.ini"]
