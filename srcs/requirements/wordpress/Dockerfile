FROM debian:bullseye

RUN apt-get update -y && \
apt-get upgrade -y && \
apt-get install -y \
php7.4 \
php-fpm \
php-cli \
wget \
curl \
php-mysql \
php-mbstring \
php-xml \
sendmail \
tini \
vim

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir /run/php

COPY ./tools/create_wordpress.sh /

RUN chmod +x /create_wordpress.sh

ENTRYPOINT ["/usr/bin/tini", "--", "/create_wordpress.sh" ]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.4", "-F"]