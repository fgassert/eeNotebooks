#!/bin/bash
NAME=$(basename $PWD)
PG_NAME=postgis

docker build -t $NAME .
docker run --name $PG_NAME -P --env-file .env -d --rm mdillon/postgis
docker run --link $PG_NAME --init -it -p 8888:8888 -v "$PWD/notebooks:/home/notebooks" --env-file .env --rm $NAME $@
docker kill $PG_NAME
