#!/bin/sh
FILE=wordpress
cd /var/www/html

if [ -d "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE not exists." 
    mkdir -p wordpress
    cd wordpress
    
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    wp core download --allow-root 
    
    sleep 5
    wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --allow-root 
    sleep 5

    wp core install --url=tliot.42.fr --title=INCEPTION --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=aa --allow-root  
    wp user create $WORDPRESS_DB_USER aa --user_pass=$WORDPRESS_DB_PASSWORD --role=$WP_USER_ROLE --porcelain --allow-root 
    wp theme install neve --activate --allow-root  
    
    echo "END" 
fi
