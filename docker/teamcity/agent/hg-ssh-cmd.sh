#!/bin/sh

eval `ssh-agent` > /dev/null
for KEY in "$TEAMCITY_DATA_PATH/ssh-keys"/* ; do
    cat "$KEY" | ssh-add - 2> /dev/null
done

trap "kill $SSH_AGENT_PID" EXIT
ssh -oStrictHostKeyChecking=no "$@"
