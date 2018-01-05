FROM	richarvey/nginx-php-fpm:1.4.1

RUN apk update \
  && apk add redis \
  && apk add php7-redis \
  && rm /var/cache/apk/*
