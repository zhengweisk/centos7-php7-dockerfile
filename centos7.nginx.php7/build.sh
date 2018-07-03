#!/bin/bash

img="docker.sklinux.com:5000/c7php7"

docker build  -t "$img" .
#docker push $img
