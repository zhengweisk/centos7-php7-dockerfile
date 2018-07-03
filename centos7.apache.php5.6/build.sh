#!/bin/bash

img="docker.sk.com:5000/apache2php5:v2018"

docker build  -t "$img" .
#docker push $img
