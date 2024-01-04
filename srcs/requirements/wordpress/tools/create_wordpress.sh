#!/bin/sh

#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

####### MANDATORY PART ##########

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$WORDPRESS_DB_NAME/g" wp-config-sample.php

	cp wp-config-sample.php wp-config.php
###################################

    wp core install --url="$DOMAIN_NAME" --title=INCEPTION --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL"  --allow-root  
    wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author --allow-root 
	
fi

exec "$@"