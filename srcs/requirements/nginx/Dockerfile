FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx 


RUN apt-get install -y nginx openssl

RUN openssl req \
            -x509 \
            -nodes \
            -days 365 \
            -newkey rsa:2048 \
            -keyout /etc/ssl/private/nginx-selfsigned.key \
            -out /etc/ssl/certs/nginx-selfsigned.crt \
            -subj '/C=KR/ST=Seoul/L=Seoul/O=42seoul/OU=salee2/CN=www.example.co.kr'

RUN echo "ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;\nssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;" > /etc/nginx/snippets/self-signed.conf

RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048

COPY ./conf/ssl-params.conf /etc/nginx/snippets/


COPY ./conf/default /etc/nginx/sites-available/default

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]