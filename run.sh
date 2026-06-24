#!/usr/bin/env bash
set -e
DBURL="${SCALINGO_POSTGRESQL_URL:-$DATABASE_URL}"
BASE="${DBURL%%\?*}"
DSN="${BASE}?sslmode=require&connect_timeout=10&binary_parameters=yes"
export MM_CONFIG="$DSN"
export MM_SQLSETTINGS_DRIVERNAME=postgres
export MM_SQLSETTINGS_DATASOURCE="$DSN"
export MM_SERVICESETTINGS_LISTENADDRESS=":${PORT:-8065}"
echo "[artha] starting Mattermost on :${PORT:-8065}"
exec bin/mattermost
