#!/bin/sh
${TCMASTER_SERVER=http://$TCMASTER_PORT_8111_TCP_ADDR:$TCMASTER_PORT_8111_TCP_PORT}
${AGENT_NAME=$HOSTNAME}

trap "echo TRAPed signal" HUP INT QUIT KILL TERM
if [ ! -f $HOME/bin/agent.sh ]; then
    wget -O/tmp/buildAgent.zip $TCMASTER_SERVER/update/buildAgent.zip \
    && unzip -q -d $HOME /tmp/buildAgent.zip \
    && rm /tmp/buildAgent.zip \
    && chmod +x $HOME/bin/agent.sh \
    && cat > $HOME/conf/buildAgent.properties << EOF
serverUrl=$TCMASTER_SERVER
workDir=work
tempDir=temp
systemDir=system
name=$AGENT_NAME
EOF
fi

cat $HOME/conf/buildAgent.properties

$HOME/bin/agent.sh start

echo "[hit enter key to exit] or run 'docker stop <container>'"
read -r DISCARD

$HOME/bin/agent.sh stop force
