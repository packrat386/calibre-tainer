#!/usr/bin/env sh

calibre-server \
  --userdb "${CALIBRE_USERDB_PATH}" \
  --enable-auth \
  --auth-mode basic \
  --disable-use-bonjour \
  --disable-use-sendfile \
  "${CALIBRE_LIBRARY_PATH}"
