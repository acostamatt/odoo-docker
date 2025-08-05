#!/usr/bin/env bash

set -e

# Wait for Postgresql to be ready
until pg_isready -h "$HOST" -U "$USER" > /dev/null 2>&1; do
    sleep 2
done

# Check if the “res_users” table already exists (base module installed)
if ! PGPASSWORD="$PASSWORD" psql -h "$HOST" -U "$USER" -d "$DB" -c "\dt" | grep -q "res_users"; then
    odoo -c /etc/odoo/odoo.conf -d "$DB" -i base --without-demo=all
fi

# Start Odoo
exec odoo -c /etc/odoo/odoo.conf
