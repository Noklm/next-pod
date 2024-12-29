#!/bin/bash

podman exec -i postgres /usr/bin/pg_dumpall -U nextcloud > postgres-backup.sql
podman volume export nextcloud --output nextcloud.tar

