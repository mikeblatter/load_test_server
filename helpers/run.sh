#!/usr/bin/env bash

# Script specifics
COMPOSE_FILE_NAME=$1
PROJECT_NAME=${PWD##*/}

if [ -z $COMPOSE_FILE_NAME ]; then
    echo "You must pass in the compose file name as the first parameter"
    exit 2
fi

docker-compose -f docker/$COMPOSE_FILE_NAME -p $PROJECT_NAME up -d