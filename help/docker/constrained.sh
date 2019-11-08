#!/bin/bash

echo 'starting up the constrained docker container'
docker-compose up -d
docker stats --no-stream docker_bin_1
echo 'look Ma, only 2gb of RAM'