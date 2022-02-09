# Documentation

## Command Override

1. Check for `settings.command` in the `.drone.yml`.
2. Check for argument passed to entrypoint script in the Docker image.
3. If no command is detected, then default to `analyze`.

## Docker

```
docker run --rm \
  -e PLUGIN_API_KEY="[ . . . REDACTED . . . ]" \
  -e PLUGIN_COMMAND="test" \
  -e PLUGIN_DEBUG="true" \
  rancher/drone-fossa:latest
```

