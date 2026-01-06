#!/usr/bin/env sh

calibre-server \
  --userdb "${CALIBRE_USERDB_PATH}" \
  --manage-users
