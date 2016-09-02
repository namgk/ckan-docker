FROM nhong/ckan-source

ARG VER=2.5
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y apache2 libapache2-mod-wsgi libapache2-mod-rpaf

COPY ckan_wsgi.py /etc/ckan/default/
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2ensite 000-default

RUN mv /etc/ckan/default/development.ini /etc/ckan/default/production.ini
RUN sed -i "s/Listen 80/Listen 8080/" /etc/apache2/ports.conf

EXPOSE 8080
VOLUME ["/etc/apache2","/var/log/apache2"]

COPY apache2-foreground /usr/local/bin/

CMD ["apache2-foreground"]

