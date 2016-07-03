FROM composer:composer

MAINTAINER Alexander Melihov <amelihovv@ya.ru>

RUN \
    mkdir -p /var/www/html

VOLUME /var/www/html
WORKDIR /var/www/html

ENTRYPOINT ["composer"]
CMD ["--help"]

