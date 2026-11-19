FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -subj "/C=MA/ST=Marrakech/L=Marrakech/O=Inception/OU=42/CN=yofouzi.42.fr" \
        -addext "subjectAltName=DNS:yofouzi.42.fr" \
        -keyout /etc/nginx/ssl/inception.key \
        -out /etc/nginx/ssl/inception.crt && \
    rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
