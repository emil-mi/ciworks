FROM ciworks-base
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN useradd -m -s /bin/bash teamcity

ADD bootstrap-agent.sh hg-ssh-cmd.sh /usr/local/bin/

USER teamcity
CMD ["/usr/local/bin/bootstrap-agent.sh"]
