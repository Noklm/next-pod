# Next-Pod
The idea is to have an entire working Nextcloud instance behind a Caddy reverse proxy using only DNS challenge. Working together in a podman pod as rootless containers.

## Misc
Allow rootless Podman containers to bind to ports >= 443:
https://github.com/containers/podman/blob/main/rootless.md
```sh
sudo sysctl net.ipv4.ip_unprivileged_port_start=443
```

Open the port in your firewall and don't forget to open it on your VPS provider firewall:
https://firewalld.org/documentation/howto/open-a-port-or-service.html
```sh
sudo firewall-cmd --permanent --zone=public --add-port=443/tcp
sudo systemctl restart firewalld
```

Enable podman socket:
https://github.com/containers/podman/blob/main/docs/tutorials/socket_activation.md
```sh
systemctl --user start podman.socket
```