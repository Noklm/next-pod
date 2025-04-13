#!/bin/bash

podman exec -i postgres pg_dumpall -U nextcloud > postgres-backup.sql
podman volume export nextcloud --output nextcloud.tar

