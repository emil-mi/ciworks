#!/bin/sh

USER=${USER:-$(id -un)}
HOME=${HOME:-$(getent passwd "$USER" | cut -d: -f6 )}

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

echo "[ui]" > "$HOME/.hgrc"
echo "ssh = hg-ssh-cmd.sh" >> "$HOME/.hgrc"

/opt/TeamCity/bin/teamcity-server.sh start

echo "[hit enter key to exit] or run 'docker stop <container>'"
read -r DISCARD

/opt/TeamCity/bin/teamcity-server.sh stop force
