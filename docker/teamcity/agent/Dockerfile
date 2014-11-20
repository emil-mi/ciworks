FROM ciworks-base
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN useradd -m -s /bin/bash teamcity

ADD bootstrap-agent.sh /usr/local/bin/

EXPOSE 9090
USER teamcity
CMD ["/usr/local/bin/bootstrap-agent.sh"]
