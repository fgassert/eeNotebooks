#!/bin/bash
PG_NAME=postgis
PG_PASS=pw
NAME=notebooks

docker build -t $NAME .
docker run --name $PG_NAME -P --env-file .env -d --rm mdillon/postgis
docker run --link $PG_NAME --init -it -p 8888:8888 -v "$PWD/notebooks:/home/notebooks" --env-file .env $NAME $@
docker kill $PG_NAME
