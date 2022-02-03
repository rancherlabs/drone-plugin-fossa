#!/bin/sh
set -eu

fossa_cli_command="${1:-}"

fossa "${fossa_cli_command}"
