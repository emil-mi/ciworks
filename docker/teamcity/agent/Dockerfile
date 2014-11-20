FROM ciworks-base
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN useradd -m teamcity
VOLUME  ["/home/teamcity"]

ADD setup-agent.sh /home/teamcity/

EXPOSE 9090
USER teamcity
CMD ["/home/teamcity/setup-agent.sh"]
