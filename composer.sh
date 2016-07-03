#!/bin/sh

docker run --volumes-from app_datastore --link mysql:mysql --rm composer "$@"

