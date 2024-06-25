#!/bin/bash

podman run -d \
    --name postgres \
    --pod nextcloud-pod \
    --restart always \
    --secret postgres_db,type=env,target=POSTGRES_DB \
    --secret postgres_user,type=env,target=POSTGRES_USER \
    --secret postgres_password,type=env,target=POSTGRES_PASSWORD \
    --mount type=volume,source=nextcloud-pg-db,target=/var/lib/postgresql/data,relabel=private \
    postgres:latest