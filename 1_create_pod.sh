#!/bin/bash

podman pod create \
    --publish 9000:9000 \
    --network slirp4netns nextcloud-pod
    