FROM debian:bookworm

RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get -y install \
php8.2 \
php-fpm \
php-cli \
wget \
curl \
php-mysql \
php-mbstring \
php-xml \
sendmail \
vim

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

# Copy the .conf in the html directory
COPY ./wordpress/conf/www.conf /etc/php/8.2/fpm/pool.d/

COPY ./wordpress/conf/index.php /var/www/html/wordpress/index.php
# FOR WORDPRESS
COPY ./wordpress/tools/create_wordpress.sh /
RUN chmod +x /create_wordpress.sh

ENTRYPOINT ["/create_wordpress.sh" ]

# WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm8.2", "-F"]