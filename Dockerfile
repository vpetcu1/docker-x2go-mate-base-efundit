FROM vpetcu1/x2go-mate-base-eclipse
MAINTAINER Vasilica Petcu <vpetcu1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

USER root


#clean up
RUN rm -rf /tmp/*

RUN apt-get -y autoclean && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*

COPY ["*.sh", "/"]
RUN chmod +x /*.sh

RUN sh /x2go-mate-base-eclipse-efundit-entrypoint.sh
EXPOSE 22
ENTRYPOINT ["/start-supervisor.sh"]
