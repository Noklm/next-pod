#!/bin/bash

podman secret create ovh_endpoint secrets/ovh_endpoint.txt
podman secret create ovh_application_key secrets/ovh_application_key.txt
podman secret create ovh_application_secret secrets/ovh_application_secret.txt
podman secret create ovh_consumer_key secrets/ovh_consumer_key.txt

podman secret create postgres_db secrets/postgres_db.txt
podman secret create postgres_user secrets/postgres_user.txt
podman secret create postgres_password secrets/postgres_password.txt

podman secret create nextcloud_trusted_domains secrets/nextcloud_trusted_domains.txt

podman secret create domain secrets/domain.txt

podman secret create vaultwarden_domain secrets/vaultwarden_domain.txt
podman secret create vaultwarden_admin_token secrets/vaultwarden_admin_token.txt
