#!/bin/sh

docker run --volumes-from app_ds --link mysql:mysql --rm artisan "$@"

