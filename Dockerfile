FROM debian:trixie-slim as debian-calibre

RUN apt update && apt install -y calibre

FROM debian-calibre as debian-calibre-server

WORKDIR /srv/calibre

COPY ./scripts ./scripts

ENV CALIBRE_LIBRARY_PATH=/srv/calibre/library
ENV CALIBRE_USERDB_PATH=/srv/calibre/userdb/users.sqlite

RUN mkdir -p ${CALIBRE_LIBRARY_PATH}
RUN mkdir -p $(dirname ${CALIBRE_USERDB_PATH})

CMD ["./scripts/serve.sh"]