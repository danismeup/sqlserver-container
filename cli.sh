#!/usr/bin/env bash
# Quick sqlcmd shell into the dev SQL Server container.
# Pass optional args e.g.: ./cli.sh -Q "SELECT @@VERSION"
set -euo pipefail
docker exec -it dev-sqlserver \
  /opt/mssql-tools18/bin/sqlcmd \
  -S localhost -U sa -P "DevPassword123!" -C \
  "$@"
