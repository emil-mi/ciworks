FROM ubuntu-debootstrap:trusty
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN apt-get update \
    && apt-get install -y openjdk-7-jre-headless tar wget unzip sudo \
       mercurial mercurial-git git \
    && rm -rf /var/lib/apt/lists/*

