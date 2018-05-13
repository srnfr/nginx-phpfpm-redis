#!/bin/bash

set -ex
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=reytans
# image name
IMAGE=nginx-phpfpm-redis
docker build --build-arg=token=MTRkZjZiOGJkNzlh -t $USERNAME/$IMAGE:latest --no-cache .
