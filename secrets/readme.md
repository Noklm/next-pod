To load a secret

```sh
podman secret create <secret_name> <path/to/secret/file.txt>
```

use a secret as env var:
```sh
podman run -d \
    ... \
    --secret <secret_name>,type=env,target=<ENV_VAR> \
    ...
```