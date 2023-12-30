FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx 

COPY ./nginx/conf/default /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]