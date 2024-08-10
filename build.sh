#!/bin/bash

set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
#USERNAME=reytans
# image name
IMAGE=nginx-phpfpm-redis
docker build  -t $IMAGE .
