#!/bin/bash -ex

# Usage: deploy.sh /home/jcurny/project user@server /var/www/html

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
zip -qr /tmp/deploy/${zipName} $1

ssh $2 "mkdir -p /tmp/deploy/ondeck && rm -rf /tmp/deploy/ondeck"
scp /tmp/deploy/${zipName} $2:/tmp/deploy/ondeck/${zipName}
ssh $2 unzip /tmp/deploy/ondeck/${zipName} && rm /tmp/deploy/ondeck/${zipName}
