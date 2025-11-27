#!/bin/bash

#####################################################################
#                                                                   #
# Script:  docker-build-check.sh                                    #
#                                                                   #
# Purpose: Run docker build --check and filter out warnings.        #
#                                                                   #
# Author:  admin <admin@nova.eco>                                   #
#                                                                   #
# Date:    November 27th 2025                                       #
#                                                                   #
#####################################################################

# Run docker build --check and filter out SecretsUsedInArgOrEnv warnings
docker build --check . 2>&1 | grep -vE '(SecretsUsedInArgOrEnv|Do not use ARG|MARIADB|^Dockerfile:[0-9]+$|^-+$|>>>|^WARNING:|ARG.*=|LABEL authors|Check complete.*warnings|^\s+[0-9]+\s+\||^\s*$)' | sed '/^$/d' || test $? = 1
