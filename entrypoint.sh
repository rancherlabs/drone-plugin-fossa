#!/bin/sh
set -eu

# Read settings.api_key from .drone.yml file
export FOSSA_API_KEY="${PLUGIN_API_KEY}"

# Execute analyze by default
fossa_cli_command="${1:-analyze}"

fossa "${fossa_cli_command}"
