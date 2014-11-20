#!/bin/sh

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

/opt/TeamCity/bin/teamcity-server.sh start

echo "[hit enter key to exit] or run 'docker stop <container>'"
read -r DISCARD

/opt/TeamCity/bin/teamcity-server.sh stop force
