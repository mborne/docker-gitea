ARG version=latest
FROM gitea/gitea:${version}

COPY bin /usr/bin/.
RUN chmod +x /usr/bin/*.sh

VOLUME /backup
