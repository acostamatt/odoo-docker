#!/usr/bin/env bash
set -euo pipefail

# Default variables
: "${DB:=odoo}"
: "${HOST:=db}"
: "${USER:=odoo}"
: "${PASSWORD:=odoo}"
: OD_CONF="${OD_CONF:-/etc/odoo/odoo.conf}"
: INIT_MODULES="${INIT_MODULES:-base,l10n_ar_afipws,l10n_ar_afipws_fe}"
# Wait for PostgreSQL to be ready
until pg_isready -h "$HOST" -U "$USER" -d "$DB" > /dev/null 2>&1; do
  sleep 2
done

# Check if tables already exist (res_users indicates base installation)
if ! PGPASSWORD="$PASSWORD" psql -h "$HOST" -U "$USER" -d "$DB" -tAc "SELECT 1 FROM pg_tables WHERE tablename = 'res_users';" | grep -q 1; then
  exec odoo -c /etc/odoo/odoo.conf -d "$DB" -i "$INIT_MODULES" --without-demo=all
else
  exec odoo -c /etc/odoo/odoo.conf
fi
