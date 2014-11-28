FROM ciworks-base
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

ENV TEAMCITY_DATA_PATH /data/teamcity

RUN wget -O- http://download.jetbrains.com/teamcity/TeamCity-8.1.5.tar.gz | tar xz -C /opt

ADD bootstrap-server.sh hg-ssh-cmd.sh /usr/local/bin/

VOLUME  ["/data/teamcity"]

EXPOSE 8111
CMD ["/usr/local/bin/my_init", "/usr/local/bin/bootstrap-server.sh"]
