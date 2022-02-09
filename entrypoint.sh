#!/bin/sh
set -eu

# Read settings.api_key from .drone.yml file
export FOSSA_API_KEY="${PLUGIN_API_KEY}"

# Read settings.command from .drone.yml file
settings_command="${PLUGIN_COMMAND:-}"

# Read settings.debug from .drone.yml file
settings_debug="${PLUGIN_DEBUG:-}"

# Check for fossa-cli command
if [ -z "${settings_command}" ]; then
  # Execute analyze by default
  fossa_cli_command="${1:-analyze}"

  if [ "${settings_debug}" = "true" ]; then
    echo "entrypoint script argument command is ${fossa_cli_command}"
  fi
else
  fossa_cli_command="${settings_command}"

  if [ "${settings_debug}" = "true" ]; then
    echo "environment variable command is ${fossa_cli_command}"
  fi
fi

if [ "${settings_debug}" = "true" ]; then
  echo "fossa-cli command is ${fossa_cli_command}"
fi

fossa "${fossa_cli_command}"

