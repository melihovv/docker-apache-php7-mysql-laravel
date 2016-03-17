FROM php:7.0-cli

MAINTAINER Alexander Melihov <amelihovv@ya.ru>

RUN \
    docker-php-ext-install -j$(nproc) pdo pdo_mysql mbstring && \
    mkdir -p /var/www/html

VOLUME /var/www/html
WORKDIR /var/www/html

ENTRYPOINT ["php", "artisan"]
CMD ["--help"]

