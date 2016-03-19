FROM busybox

MAINTAINER Alexander Melihov <amelihovv@ya.ru>

RUN \
	mkdir -p /var/www/html && \
    	mkdir -p /var/www/html/storage && \
    	mkdir -p /var/www/bootstrap/cache && \
	chown -R www-data:www-data /var/www/html

VOLUME /var/www/html
CMD /bin/sh

