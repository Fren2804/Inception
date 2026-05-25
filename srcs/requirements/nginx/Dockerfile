FROM alpine:3.21


RUN apk update && apk add --no-cache nginx openssl


RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=ES/ST=Madrid/L=Madrid/O=42/OU=42Madrid/CN=franmore.42.fr"


COPY conf/nginx.conf /etc/nginx/http.d/default.conf


EXPOSE 443


CMD ["nginx", "-g", "daemon off;"]