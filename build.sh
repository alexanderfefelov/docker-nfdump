#!/bin/sh

docker build --tag alexanderfefelov/docker-nfdump-data data
docker build --tag alexanderfefelov/docker-nfdump-collector collector
