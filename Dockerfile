#####################################################################
#                                                                   #
# DOCKERFILE                                                        #
# ----------                                                        #
#                                                                   #
# Purpose: Docker def for nova-db.                                  #
#                                                                   #
# Author:  admin <admin@nova.eco>                                   #
#                                                                   #
# Date:    November 26th 2025                                       #
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

LABEL authors=${NOVA_DB__AUTHOR}
COPY ${NOVA_DB__SQL__PATH}/${NOVA_DB__SQL__FILE} /docker-entrypoint-initdb.d

CMD ["mariadbd"]
