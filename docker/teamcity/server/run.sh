#!/bin/sh
docker run -dt -v /home/vagrant/docker/teamcity/server/data:/data/teamcity --name=tcmaster -p 8111:8111 ciworks-server
