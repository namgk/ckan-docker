FROM ubuntu:trusty

ARG VER=2.5
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y wget nginx apache2 libapache2-mod-wsgi libpq5
RUN wget http://packaging.ckan.org/python-ckan_$VER-trusty_amd64.deb
RUN dpkg -i python-ckan_2.5-trusty_amd64.deb

RUN rm *.deb
RUN mkdir /ckan-plugins
ENV PYTHONPATH=/ckan-plugins

EXPOSE 8080
VOLUME ["/etc/ckan/default","/var/log/apache2","/ckan-plugins"]

COPY apache2-foreground /usr/local/bin/
CMD ["apache2-foreground"]
