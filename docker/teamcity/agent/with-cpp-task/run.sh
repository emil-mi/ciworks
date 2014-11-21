#!/bin/sh

docker run -dt --link tcmaster:tcmaster \
   --privileged=true --cap-add=all \
  -v /vagrant/compilers:/var/lib/compiler-images \
  -v /home/vagrant/docker/teamcity/server/data/ssh-keys:/ssh-keys \
  --name tcagent ciworks-agent-with-cpp-task
