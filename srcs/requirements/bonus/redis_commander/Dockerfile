FROM alpine:3.21


RUN apk update && apk add --no-cache nodejs npm


RUN npm install -g redis-commander


EXPOSE 8081


ENTRYPOINT ["redis-commander", "--redis-label", "InceptionCache", "--redis-host", "redis", "--address", "0.0.0.0"]