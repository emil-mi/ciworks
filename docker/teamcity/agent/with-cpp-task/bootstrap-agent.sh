#!/bin/sh
TCMASTER_SERVER=${TCMASTER_SERVER:-"http://$TCMASTER_PORT_8111_TCP_ADDR:$TCMASTER_PORT_8111_TCP_PORT"}
AGENT_NAME=${AGENT_NAME:-$HOSTNAME}
USER=${USER:-$(id -un)}
HOME=${HOME:-$(getent passwd "$USER" | cut -d: -f6 )}

trap "echo TRAPed signal" HUP INT QUIT KILL TERM
if [ ! -f $HOME/buildAgent/bin/agent.sh ]; then
    echo "Installing agent"

    wget -O/tmp/buildAgent.zip $TCMASTER_SERVER/update/buildAgent.zip \
    && unzip -q -d "$HOME/buildAgent" /tmp/buildAgent.zip \
    && chmod +x "$HOME/buildAgent/bin/agent.sh" \
    && cat > "$HOME/buildAgent/conf/buildAgent.properties" << EOF
serverUrl=$TCMASTER_SERVER
workDir=../../data/work
tempDir=../../data/temp
systemDir=../../data/system
name=$AGENT_NAME
ownPort=$AGENT_PORT
authorizationToken=$AGENT_AUTHORIZATION
EOF

    rm /tmp/buildAgent.zip > /dev/null

    echo "Installing compilers"
    ls -1 /var/lib/compiler-images/*.tar.gz | xargs --replace={} sudo cvm add "{}"
    mkdir -p "$HOME/bin"
    cvm -v wrap -d "$HOME/bin" gcc g++ ld ar ldd

    echo "Creating .hgrc"
    echo "[ui]" > "$HOME/.hgrc"
    echo "ssh = hg-ssh-cmd.sh" >> "$HOME/.hgrc"

fi

if [ ! -f $HOME/buildAgent/bin/agent.sh ]; then
    echo "The build agent did not install successfully." >&2
    echo "Does '$TCMASTER_SERVER' look ok? If not set \$TCMASTER_SERVER (and \$AGENT_NAME) to correct values and try again" >&2
    exit 127
fi

#The server URL can change between runs of docker
grep -v "^serverUrl=" "$HOME/buildAgent/conf/buildAgent.properties" > "$HOME/buildAgent/conf/buildAgent.properties.new"
echo "serverUrl=$TCMASTER_SERVER" >> "$HOME/buildAgent/conf/buildAgent.properties.new"
mv -f "$HOME/buildAgent/conf/buildAgent.properties.new" "$HOME/buildAgent/conf/buildAgent.properties"

. "$HOME/.profile"
export CVM_IMAGES="$(cvm list | tr '\n' ' ')"
"$HOME/buildAgent/bin/agent.sh" start

tail -f "$HOME/buildAgent/logs/teamcity-agent.log" &

echo "[hit enter key to exit] or run 'docker stop <container>'"
read -r DISCARD

"$HOME/buildAgent/bin/agent.sh" stop force
