#####################################################################
#                                                                   #
# DOCKERFILE                                                        #
# ----------                                                        #
#                                                                   #
# Purpose: Docker def for nova-db.                                  #
#                                                                   #
# Author:  admin <admin@nova.eco>                                   #
#                                                                   #
# Date:    November 27th 2025                                       #
#                                                                   #
#####################################################################

#####################################################################
#                                                                   #
# EXAMPLES                                                          #
# --------                                                          #
#                                                                   #
# 1. npm start (run from the root of the current workspace)         #
#                                                                   #
#    Performs formatting and linting.                               #
#                                                                   #
#####################################################################

FROM mariadb:lts-noble

ARG NOVA_DB__AUTHOR
ARG NOVA_DB__SQL__FILE
ARG NOVA_DB__SQL__PATH

# Build-time database configuration for pre-seeding
ARG MARIADB_DATABASE=nova
ARG MARIADB_ROOT_PASSWORD=pass
ARG MARIADB_USER=nova_api
ARG MARIADB_PASSWORD=nova_api_pass

# Make build args available at runtime as environment variables
ENV MARIADB_DATABASE=${MARIADB_DATABASE}
ENV MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD}
ENV MARIADB_USER=${MARIADB_USER}
ENV MARIADB_PASSWORD=${MARIADB_PASSWORD}

LABEL authors=${NOVA_DB__AUTHOR}

# Copy initialization script and SQL files
COPY scripts/init-database.sh /usr/local/bin/init-database.sh
COPY ${NOVA_DB__SQL__PATH}/${NOVA_DB__SQL__FILE} /docker-entrypoint-initdb.d/

# Pre-seed the database during build
# This runs MariaDB, initializes it with the SQL scripts, then stops it
# The populated database is baked into the image
RUN chmod +x /usr/local/bin/init-database.sh && \
    /usr/local/bin/init-database.sh

CMD ["mariadbd"]
