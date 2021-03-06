#!/usr/bin/env bash

export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

echo "Current working directory: '"$(pwd)"'"

docker run --rm -v $(pwd):/var/www/html --link mysql:mysql \
    --link laravel_redis:redis php "$@"

