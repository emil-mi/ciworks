FROM ciworks-base
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN useradd -m -s /bin/bash teamcity

ADD bootstrap-agent.sh hg-ssh-cmd.sh /usr/local/bin/

ENV AGENT_PORT 9090
EXPOSE 9090

USER teamcity
CMD ["/usr/local/bin/my_init", "/usr/local/bin/bootstrap-agent.sh"]
