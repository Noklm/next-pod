#!/bin/bash

podman run -d \
    --name nextcloud-fpm \
    --pod nextcloud-pod \
    --restart always \
    --env POSTGRES_HOST=localhost \
    --secret nextcloud_trusted_domains,type=env,target=NEXTCLOUD_TRUSTED_DOMAINS \
    --secret postgres_db,type=env,target=POSTGRES_DB \
    --secret postgres_user,type=env,target=POSTGRES_USER \
    --secret postgres_password,type=env,target=POSTGRES_PASSWORD \
    --mount type=volume,source=nextcloud,target=/var/www/html,relabel=shared \
    nextcloud:fpm