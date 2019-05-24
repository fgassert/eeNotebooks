#!/bin/bash
NAME=notebooks

docker build -t $NAME .
docker run --init -it -p 8888:8888 -v "$PWD/notebooks:/home/notebooks" --env-file .env $NAME $@
