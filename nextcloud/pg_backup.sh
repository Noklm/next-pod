#!/bin/bash

podman exec -i postgres /usr/bin/pg_dumpall -U nextcloud > postgres-backup.sql

