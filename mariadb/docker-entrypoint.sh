#!/bin/sh

service mariadb start 

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql

echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql

echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql

echo "FLUSH PRIVILEGES;" | mysql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld