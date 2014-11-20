FROM ciworks-base
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

ENV TEAMCITY_DATA_PATH /data/teamcity

ADD bootstrap-server.sh /usr/local/bin/

RUN wget -O- http://download.jetbrains.com/teamcity/TeamCity-8.1.5.tar.gz | tar xz -C /opt

VOLUME  ["/data/teamcity"]

EXPOSE 8111
CMD ["/usr/local/bin/bootstrap-server.sh"]
