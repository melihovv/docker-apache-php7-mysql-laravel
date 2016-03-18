# docker-apache-php7-mysql-laravel
Docker images for launching laravel app

Your .env file should contains following variables:  
DB_HOST="${MYSQL_PORT_3306_TCP_ADDR}"  
DB_DATABASE="${MYSQL_ENV_MYSQL_DATABASE}"  
DB_USERNAME="${MYSQL_ENV_MYSQL_USER}"  
DB_PASSWORD="${MYSQL_ENV_MYSQL_PASSWORD}"

1. change VOLUME_MAP variable in Makefile with your laravel app.
NOTE: if you use Windows path must begin with two slashes, example:
//c/Users/melihovv/my_laravel_app:/var/www/html
2. make build
3. make run
4. make migrate
5. docker-machine ip your_machine_name
6. go to browser by that ip

