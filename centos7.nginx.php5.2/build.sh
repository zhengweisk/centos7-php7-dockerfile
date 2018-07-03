#!/bin/bash

img="docker.78dk.com:5000/php56:v2017"
#img="docker.sklinux.com:5000/c7php56:v2017"

docker build  -t "$img" .
docker push $img
