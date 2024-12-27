#!/bin/bash

FILE=$PWD/mosquitto_passwd.txt
if [ -f "$FILE" ]; then
    echo "$FILE exists."
    podman run -it --rm \
        --userns=keep-id \
        --mount type=bind,source=$FILE,target=/mosquitto/config/mosquitto_passwd.txt,relabel=private \
        eclipse-mosquitto \
        mosquitto_passwd /mosquitto/config/mosquitto_passwd.txt $1
else 
    echo "$FILE does not exist."
    touch $FILE
    chmod 0700 $FILE
    podman run -it --rm \
        --userns=keep-id \
        --mount type=bind,source=$FILE,target=/mosquitto/config/mosquitto_passwd.txt,relabel=private \
        eclipse-mosquitto \
        mosquitto_passwd -c /mosquitto/config/mosquitto_passwd.txt $1
fi

