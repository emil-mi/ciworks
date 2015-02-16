FROM ubuntu-debootstrap:trusty
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive \
    && echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-transport-https ca-certificates \
       default-jre-headless python3-minimal \
       tar wget curl psmisc unzip sudo vim openssh-client \
       mercurial mercurial-git git \
       libc6:i386 libstdc++6:i386 \
    && ln -sf /bin/bash /bin/sh \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD my_init /usr/local/bin/