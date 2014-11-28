FROM ubuntu-debootstrap:trusty
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive \
    && echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-transport-https ca-certificates \
       default-jre-headless python3-minimal \
       tar wget curl psmisc unzip sudo vim \
       mercurial mercurial-git git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD my_init /usr/local/bin/