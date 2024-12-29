#!/bin/bash

podman run -d \
    --name web \
    --pod nextcloud-pod \
    --restart always \
    --mount type=bind,source=$PWD/Caddyfile,target=/etc/caddy/Caddyfile,readonly,relabel=private \
    --mount type=volume,source=nextcloud_web_data,target=/data,relabel=private \
    --mount type=volume,source=nextcloud,target=/var/www/html,readonly,relabel=shared \
    caddy:2.8.4-alpine