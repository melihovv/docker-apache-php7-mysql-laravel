FROM php:7.0-apache

MAINTAINER Alexander Melihov <amelihovv@ya.ru>

RUN \
    sed -i 's#DocumentRoot /var/www/html#DocumentRoot /var/www/html/public#' \
        /etc/apache2/apache2.conf && \
    a2enmod rewrite && \
    docker-php-ext-install -j$(nproc) pdo pdo_mysql mbstring

WORKDIR /var/www/html

