FROM php:7.0-apache

MAINTAINER Alexander Melihov <amelihovv@ya.ru>

COPY php.ini /usr/local/etc/php/

ENV PHPREDIS_VERSION php7

RUN \
    sed -i 's#DocumentRoot /var/www/html#DocumentRoot /var/www/html/public#' \
        /etc/apache2/apache2.conf && \
    a2enmod rewrite && \
    curl -L -o /tmp/redis.tar.gz \
        https://github.com/phpredis/phpredis/archive/$PHPREDIS_VERSION.tar.gz && \
    tar xfz /tmp/redis.tar.gz && \
    rm -r /tmp/redis.tar.gz && \
    mv phpredis-$PHPREDIS_VERSION /usr/src/php/ext/redis && \
    docker-php-ext-install -j$(nproc) pdo pdo_mysql mbstring redis

WORKDIR /var/www/html

