#!/bin/bash
set -e

source /var/app/venv/*/bin/activate
cd /var/app/current

mkdir -p /var/app/data
touch /var/app/data/db.sqlite3
chown webapp:webapp /var/app/data/db.sqlite3 || true
chmod 664 /var/app/data/db.sqlite3 || true

python manage.py migrate --noinput
python manage.py collectstatic --noinput