#!/bin/bash

# see https://docs.gitea.io/en-us/backup-and-restore/#restore-command-restore

if [ -z "$1" ];
then
    echo "Usage : gitea-restore.sh <path-to-zip>"
    exit 1
fi

if [ ! -e "$1" ];
then
    echo "$1 not found!"
    exit 1
fi
ZIP_PATH=$1

#-------------------------------------------
# Extract ZIP
#-------------------------------------------
mkdir -p /tmp/gitea-dump
rm -rf /tmp/gitea-dump/*
cd /tmp/gitea-dump
unzip $ZIP_PATH

#-------------------------------------------
# Restore configuration
#-------------------------------------------
mkdir -p /data/gitea/conf
cp app.ini /data/gitea/conf/app.ini

#-------------------------------------------
# Restore repositories
#-------------------------------------------
unzip gitea-repo.zip
mkdir -p /data/git/repositories/
rm -rf /data/git/repositories/*
mv repositories/* /data/git/repositories/

#-------------------------------------------
# Restore database
#-------------------------------------------
#mysql -u$USER -p$PASS $DATABASE <gitea-db.sql
rm -f /data/gitea/gitea.db
sqlite3 /data/gitea/gitea.db < gitea-db.sql

#-------------------------------------------
# Fix permission
#-------------------------------------------
chown -R git:git /data/gitea

