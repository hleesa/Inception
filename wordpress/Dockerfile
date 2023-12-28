#  # SPECIFIE LA DISTRIBUTION
# FROM debian:bookworm

# RUN apt-get update && apt-get install -y php8.2-fpm 

# # To allow external connections
# COPY ./wordpress/conf/www.conf /etc/php/8.2/fpm/pool.d/

# # To create index.php  
# # COPY ./conf/index.php    /var/www/html/wordpress/index.php

# # Is optional, just a metadata
# EXPOSE 9000 

# ENTRYPOINT ["/usr/sbin/php-fpm8.2","-F" ]

# SPECIFIE LA DISTRIBUTION
# SPECIFIE LA DISTRIBUTION
FROM debian:buster
RUN apt-get update

# UDPATE & INSTALLATION
RUN apt install php-fpm  -y

# To create the PID file (/run/php/php7.3-fpm.pid)
RUN mkdir /run/php

# To allow external connections
COPY ./wordpress/conf/www.conf /etc/php/7.3/fpm/pool.d/

# To create index.php  
# COPY ./conf/index.php    /var/www/html/wordpress/index.php

# Is optional, just a metadata
EXPOSE 9000 

ENTRYPOINT ["/usr/sbin/php-fpm7.3","-F" ]