FROM ubuntu-debootstrap:trusty
MAINTAINER Emil Mieilica <emil.mieilica@gmail.com>

RUN apt-get update \
    && apt-get install -y default-jre-headless tar wget curl unzip sudo \
       mercurial mercurial-git git \
    && rm -rf /var/lib/apt/lists/*

