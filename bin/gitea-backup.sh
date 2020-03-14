#!/bin/bash

# create target directory
mkdir -p /backup/gitea

# fix permissions
chown -R git:users /backup/gitea

# create backup
cd  /backup/gitea
su git -c "gitea dump"

# keep only 3 backups
ls -1t /backup/gitea/* | tail -n +4 | xargs /bin/rm -f

# display existing backups
ls -1t /backup/gitea/*
