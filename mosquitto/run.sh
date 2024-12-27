#!/bin/bash

podman run -it -d \
    --name=mosquitto \
    --restart always \
    --userns=keep-id \
    --publish 8883:8883 \
    --mount type=bind,source=$PWD/mosquitto_passwd.txt,target=/mosquitto/config/mosquitto_passwd.txt,readonly,relabel=private \
    --mount type=bind,source=$PWD/mosquitto.conf,target=/mosquitto/config/mosquitto.conf,readonly,relabel=private \
    --mount type=volume,source=caddy_data,target=/mosquitto/certificates,readonly,relabel=shared \
    eclipse-mosquitto

