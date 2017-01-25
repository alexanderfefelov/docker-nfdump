#!/bin/sh

docker build --tag alexanderfefelov/nfdump-data data
docker build --tag alexanderfefelov/nfdump-collector collector
