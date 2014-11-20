#!/bin/sh

docker run --rm -it --link tcmaster:tcmaster -v /vagrant/compilers:/var/lib/compiler-images --name tcagent ciworks-agent-with-cpp-task 