#!/bin/bash

podman run -d \
    --name caddy \
    --pod new:nextcloud-pod \
    --publish 443:443 \
    --restart always \
    --mount type=bind,source=$PWD/Caddyfile,target=/etc/caddy/Caddyfile,readonly,relabel=private \
    --mount type=volume,source=web,target=/data,relabel=private \
    --mount type=volume,source=nextcloud,target=/var/www/html,readonly,relabel=shared \
    --secret domain,type=env,target=DOMAIN \
    --secret ovh_endpoint,type=env,target=OVH_ENDPOINT \
    --secret ovh_application_key,type=env,target=OVH_APPLICATION_KEY \
    --secret ovh_application_secret,type=env,target=OVH_APPLICATION_SECRET \
    --secret ovh_consumer_key,type=env,target=OVH_CONSUMER_KEY \
    caddy-ovh:latest