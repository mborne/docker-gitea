# mborne/docker-gitea

[gitea](https://hub.docker.com/r/gitea/gitea/) official image extended with backup/restore facilities :

* [/usr/bin/gitea-backup.sh](bin/gitea-backup.sh) generates a zip archive in `/backup/gitea`
* [/usr/bin/gitea-restore.sh](bin/gitea-restore.sh) restore a zip archive

## Usage

A [docker-compose.yml](docker-compose.yml) is provided :

* Build : `docker-compose build --pull`
* Start : `docker-compose up -d`
* Open http://gitea.localhost
* Create an account (the first one will be an administrator)

## Backup

```bash
docker-compose down
docker-compose run gitea gitea-backup.sh
docker-compose up -d
```

## Restore backup

```bash
docker-compose down
docker volume rm gitea-data
docker-compose run --rm gitea gitea-restore.sh /backup/gitea/gitea-dump-1584193586.zip
docker-compose up -d
```

## CLI management

```bash
# connect to container
docker-compose exec gitea /bin/bash
su git
./gitea --help
```

## Main files

| Path                      | Description                |
| ------------------------- | -------------------------- |
| /data/gitea/conf/app.ini  | Configuration file         |
| /data/git/repositories/   | GIT bare repositories      |
| /data/gitea/gitea.db      | Sqlite3 database (default) |
| /data/gitea/log/gitea.log | Logs                       |

