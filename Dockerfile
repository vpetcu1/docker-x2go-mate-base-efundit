FROM vpetcu1/x2go-mate-base-eclipse
MAINTAINER Vasilica Petcu <vpetcu1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

USER root

ARG TOMCAT_VERSION=8.5.43

#install tomcat 8
RUN mkdir /opt/apache-tomcat-$TOMCAT_VERSION
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-$TOMCAT_VERSION/* /opt/apache-tomcat-$TOMCAT_VERSION/
RUN ln -s /opt/apache-tomcat-$TOMCAT_VERSION /opt/tomcat

#clean up
RUN rm -rf /tmp/*

RUN apt-get -y autoclean && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

COPY ["*.sh", "/"]
RUN chmod +x /*.sh

RUN sh /x2go-mate-base-eclipse-efundit-entrypoint.sh
EXPOSE 22
ENTRYPOINT ["/start-supervisor.sh"]
