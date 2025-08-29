#!/usr/bin/env bash
set -e
superset fab create-admin --username ${SUPERSET_ADMIN:-admin} --password ${SUPERSET_PASSWORD:-admin} --firstname Admin --lastname User --email admin@example.com || true
superset db upgrade
superset init
# Optional: add a Trino database
if [ -n "${TRINO_SQLALCHEMY}" ]; then
python - <<PY
from superset import db
from superset.models.core import Database
DB_URI = "${TRINO_SQLALCHEMY}"
if not db.session.query(Database).filter_by(database_name="Trino").first():
    d = Database(database_name="Trino", sqlalchemy_uri=DB_URI)
    db.session.add(d); db.session.commit()
PY
fi
gunicorn -w 2 -k gevent --timeout 120 -b 0.0.0.0:8088 "superset.app:create_app()"
