VOLUME_MAP=//path/to/your/laravel_app:/var/www/html
DB_ROOT_PASS=db_root_pass
DB_NAME=db_name
DB_USER=db_user
DB_USER_PASS=db_user_pass

build:
	docker build -t mysql_datastore mysql_datastore/
	docker build -t app_datastore app_datastore/
	docker build -t apache_php apache_php/
	docker build -t artisan artisan/

run:
	docker run --name mysql_datastore mysql_datastore true
	docker run --name app_datastore \
		-v $(VOLUME_MAP) app_datastore true
	docker run -p 3306:3306 --name mysql --volumes-from mysql_datastore \
		-e MYSQL_ROOT_PASSWORD=$(DB_ROOT_PASS) \
		-e MYSQL_DATABASE=$(DB_NAME) \
		-e MYSQL_USER=$(DB_USER) \
		-e MYSQL_PASSWORD=$(DB_USER_PASS) \
		-d mysql:5.7
	docker run -p 80:80 --name apache_php --link mysql:mysql \
		--volumes-from app_datastore -d apache_php

migrate:
	./artisan.sh migrate

