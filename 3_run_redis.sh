#!/bin/bash

podman run -d \
    --name redis \
    --pod nextcloud-pod \
    --restart always \
    redis:latest