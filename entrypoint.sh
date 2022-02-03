#!/bin/sh
set -eu

# Execute analyze by default
fossa_cli_command="${1:-analyze}"

fossa "${fossa_cli_command}"
