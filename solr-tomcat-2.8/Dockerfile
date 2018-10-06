FROM nhong/solr-tomcat

ARG DEBIAN_FRONTEND=noninteractive

COPY schema.xml /etc/solr/conf/schema.xml

ENTRYPOINT ["/usr/share/tomcat6/bin/catalina.sh"]
CMD ["run"]
