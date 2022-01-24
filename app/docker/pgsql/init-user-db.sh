#!/bin/bash
# Script actuellement non utilisé
set -e
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker;
    CREATE DATABASE Beergarden;
    GRANT ALL PRIVILEGES ON DATABASE Beergarden TO docker;
EOSQL