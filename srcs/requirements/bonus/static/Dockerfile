FROM alpine:3.21

RUN apk update && apk add --no-cache nginx

RUN mkdir -p /var/www/static

# Primero copias los archivos
COPY conf/nginx.conf /etc/nginx/http.d/default.conf
COPY tools/index.html /var/www/static/index.html

# AQUÍ AÑADES LAS LÍNEAS:
RUN chown -R nginx:nginx /var/www/static && \
    chmod -R 755 /var/www/static

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]