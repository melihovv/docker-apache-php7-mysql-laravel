FROM composer/composer:latest

MAINTAINER Alexander Melihov <amelihovv@ya.ru>

RUN \
    docker-php-ext-install pdo pdo_mysql

# Set up the command arguments
CMD ["-"]
ENTRYPOINT ["composer", "--ansi"]

