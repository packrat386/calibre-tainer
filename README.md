calibre-tainer
---

This is a container to run the calibre content server as a standalone application. It's somewhat experimental but it works well enough for my needs. Runs calibre version 8.5 on debian trixie.

```
docker pull ghcr.io/packrat386/calibre-tainer:latest
```

## Configuration

Configured by environment variables

* `CALIBRE_LIBRARY_PATH` - The path for the calibre library to serve. Default is `/srv/calibre/library`
* `CALIBRE_USERDB_PATH` - The path for the calibre userdb. Default is `/srv/calibre/userdb/users.sqlite`

I recommend that you use a docker volume for those otherwise nothing will persist between runs

## Scripts

There are a few different entrypoints

* `./scripts/serve.sh` is the default. Starts the server on port 80.
* `./scripts/init-library.sh` runs `calibredb list` against the library. In the event that the library path is an empty directory, this is sufficient to initalize it.
* `./scripts/manage-users.sh` runs `calibre-server --manage-users` against the configured userdb.

## Further Docs

See [calibre-server docs][] and [calibredb docs][]. In particular, you probably should make sure you understand the implications of the auth options for `calibre-server` before you expose this to the internet.

[calibre-server docs]: https://manual.calibre-ebook.com/generated/en/calibre-server.html
[calibredb docs]: https://manual.calibre-ebook.com/generated/en/calibredb.html
