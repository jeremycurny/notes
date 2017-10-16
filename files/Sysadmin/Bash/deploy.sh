#!/bin/bash -ex

# $1: SRC path (/var/www/html/)
# $2: SSH credential (user@server)
# $3: SRC deploy path (/var/www/html/)

if [ -z "$1" ]; then
    echo "\$1 (SRC path) not defined"
    exit 1
fi

if [ -z "$2" ]; then
    echo "\$2 (SSH credential) not defined"
    exit 1
fi

if [ -z "$3" ]; then
    echo "\$3 (SRC deploy path) not defined"
    exit 1
fi

now=`date '+%Y%m%d%H%M%S'`;
zipFilename="deploy-${now}.zip"

mkdir -p tmpPath
zip -qr /tmp/deploy/${zipFilename} $1

ssh $2 "mkdir -p /tmp/deploy/ondeck && rm -rf /tmp/deploy/ondeck/*"
scp /tmp/deploy/${zipFilename} $2:/tmp/deploy/ondeck/${zipFilename}
ssh $2 "unzip -q -d /tmp/deploy/ondeck/ /tmp/deploy/ondeck/${zipFilename} && rm /tmp/deploy/ondeck/${zipFilename}"
