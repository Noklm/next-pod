#!/bin/bash

podman run -it \
    --mount type=bind,source=$PWD/config/,target=/mosquitto/config,relabel=private \
    eclipse-mosquitto \
    mosquitto_passwd -D /mosquitto/config/mosquitto_passwd.txt $1