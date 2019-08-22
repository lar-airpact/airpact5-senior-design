#!/bin/bash
###
# Basically runs an "ls" on the docker volume name supplied.
###

if [ "$#" -ne 2 ]; then
   echo 'Invalid argument(s).'; \
   echo "Usage $0 <docker volume name> <mount point>"
else
    docker run --rm -i -v=$1:$2 busybox find $2
fi