#! /bin/sh

ct=$(docker container ls | awk 'NR==2 {print $1}')
docker stop $ct
