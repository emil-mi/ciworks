#!/bin/sh

docker run -dt --link tcmaster:tcmaster \
  -v /vagrant/compilers:/var/lib/compiler-images \
  -v /home/vagrant/docker/teamcity/server/data/ssh-keys:/ssh-keys \
  --name tcagent ciworks-agent-with-cpp-task