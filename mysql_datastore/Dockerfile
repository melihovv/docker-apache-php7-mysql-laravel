FROM busybox

MAINTAINER Alexander Melihov <amelihovv@ya.ru>

RUN \
	adduser -H -D mysql mysql && \
	mkdir -p /var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql

VOLUME /var/lib/mysql
CMD /bin/sh
