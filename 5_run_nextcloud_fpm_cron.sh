#!/bin/bash

podman run -d \
    --name cron \
    --pod nextcloud-pod \
    --restart always \
    --mount type=volume,source=nextcloud,target=/var/www/html,relabel=shared \
    nextcloud:production-fpm /cron.sh
