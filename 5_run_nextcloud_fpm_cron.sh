#!/bin/bash

podman run -d \
    --name cron \
    --pod nextcloud-pod \
    --restart always \
    --mount type=bind,source=/media/nextcloud,target=/var/www/html,relabel=shared \
    nextcloud:30.0-fpm /cron.sh
