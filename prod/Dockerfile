FROM ubuntu:trusty

ARG VER=2.6
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget nginx apache2 libapache2-mod-wsgi libpq5 git-core
RUN wget http://packaging.ckan.org/python-ckan_$VER-trusty_amd64.deb
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN dpkg -i python-ckan_$VER-trusty_amd64.deb

RUN rm *.deb

EXPOSE 8080
VOLUME ["/etc/ckan/default","/var/log/apache2"]

COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
