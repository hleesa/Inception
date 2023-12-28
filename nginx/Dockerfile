FROM debian:bookworm

RUN apt-get -y update && apt-get install -y nginx

COPY ./nginx/conf/default /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]