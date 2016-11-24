FROM ubuntu:trusty

ARG DEBIAN_FRONTEND=noninteractive
ARG CKAN_VER=2.5-trusty_amd64
ARG MIRROR=http://packaging.ckan.org

RUN apt-get update 
RUN apt-get install -y solr-tomcat
COPY schema.xml /etc/solr/conf/schema.xml

RUN ln -s /var/log/tomcat6/ /usr/share/tomcat6/logs
RUN ln -s /etc/tomcat6/ /usr/share/tomcat6/conf

RUN sed -i "s/8080/8983/g" /etc/tomcat6/server.xml

EXPOSE 8983
VOLUME ["/var/lib/solr/data"]

ENTRYPOINT ["/usr/share/tomcat6/bin/catalina.sh"]
CMD ["run"]
