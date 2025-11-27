#!/bin/bash

#####################################################################
#                                                                   #
# Script:  init-database.sh                                         #
#                                                                   #
# Purpose: Initialize and pre-seed MariaDB database during build.   #
#                                                                   #
# Author:  admin <admin@nova.eco>                                   #
#                                                                   #
# Date:    November 27th 2025                                       #
#                                                                   #
#####################################################################

set -eux

# Initialize data directory if needed
mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# Start MariaDB in background
mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking &
pid=$!

# Wait for MariaDB to be ready
for i in $(seq 30 -1 0); do
    if echo 'SELECT 1' | mariadb --protocol=socket -uroot; then
        break
    fi
    sleep 1
done

if [ "$i" = 0 ]; then
    echo >&2 'MariaDB init process failed.'
    exit 1
fi

# Set root password
mariadb -uroot <<-EOSQL
	ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
	CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;
	CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
	GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';
	FLUSH PRIVILEGES;
EOSQL

# Execute SQL initialization scripts
for f in /docker-entrypoint-initdb.d/*; do
    case "$f" in
        *.sql)
            echo "Executing $f"
            mariadb -uroot -p"${MARIADB_ROOT_PASSWORD}" "${MARIADB_DATABASE}" < "$f"
            ;;
        *.sql.gz)
            echo "Executing $f"
            gunzip -c "$f" | mariadb -uroot -p"${MARIADB_ROOT_PASSWORD}" "${MARIADB_DATABASE}"
            ;;
        *)
            echo "Ignoring $f"
            ;;
    esac
done

# Shutdown MariaDB gracefully
if ! mariadb-admin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown; then
    kill -s TERM "$pid"
    wait "$pid"
fi

# Clean up initialization scripts (optional - keeps image smaller)
rm -rf /docker-entrypoint-initdb.d/*
