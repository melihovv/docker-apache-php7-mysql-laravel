VOLUME_MAP=//path/to/your/laravel_app:/var/www/html

DB_ROOT_PASS=db_root_pass
DB_NAME=db_name
DB_USER=db_user
DB_USER_PASS=db_user_pass


all: copy build run sleep migrate seed


build: build-mysql-ds build-app-ds build-apache-php build-artisan

build-mysql-ds:
	docker build -t mysql_datastore mysql_datastore/

build-app-ds:
	docker build -t app_datastore app_datastore/

build-apache-php:
	docker build -t apache_php apache_php/

build-artisan:
	docker build -t artisan artisan/


run: run-mysql-ds run-app-ds run-mysql run-apache-php

run-mysql-ds:
	docker run --name mysql_datastore mysql_datastore true

run-app-ds:
	docker run --name app_datastore -v $(VOLUME_MAP) app_datastore true

run-mysql:
	docker run -p 3306:3306 --name mysql --volumes-from mysql_datastore \
		-e MYSQL_ROOT_PASSWORD=$(DB_ROOT_PASS) \
		-e MYSQL_DATABASE=$(DB_NAME) \
		-e MYSQL_USER=$(DB_USER) \
		-e MYSQL_PASSWORD=$(DB_USER_PASS) \
		-d mysql:5.7 \
		--max-allowed-packet=33554432

run-apache-php:
	docker run -p 80:80 --name apache_php --link mysql:mysql \
		--volumes-from app_datastore -d apache_php


sleep:
	sleep 10

migrate:
	./artisan.sh migrate

seed:
	./artisan.sh db:seed

copy:
	cp php.ini apache_php/
	cp php.ini artisan/

