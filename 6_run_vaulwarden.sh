#!/bin/bash

# https://github.com/dani-garcia/vaultwarden/wiki/Enabling-admin-page#secure-the-admin_token
podman run -d \
    --name vaultwarden \
    --pod nextcloud-pod \
    --restart always \
    --env SIGNUPS_ALLOWED=false \
    --env ROCKET_PORT=9990 \
    --secret vaultwarden_domain,type=env,target=DOMAIN \
    --secret vaultwarden_admin_token,type=env,target=ADMIN_TOKEN \
    --mount type=volume,source=vw-data,target=/data/,relabel=private \
    vaultwarden/server:latest