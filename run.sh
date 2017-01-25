#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "You must specify path for NetFlow data directory"
    exit
fi

NETFLOW_DATA_DIR=`readlink -e $1`

if [ ${#NETFLOW_DATA_DIR} -eq 0 ]; then
    echo "You must specify valid path for NetFlow data directory"
    exit
fi

echo NetFlow data directory: $NETFLOW_DATA_DIR

docker run --name nfdump-data --volume $NETFLOW_DATA_DIR:/data alexanderfefelov/nfdump-data
docker run --name nfdump-collector --net host --restart always --detach --volume /etc/localtime:/etc/localtime:ro --volumes-from nfdump-data alexanderfefelov/nfdump-collector
