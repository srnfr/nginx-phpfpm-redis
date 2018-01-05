FROM richarvey/nginx-php-fpm:1.4.1

RUN apk update \
  && apk add redis \
  && apk add php7-redis \
  && rm /var/cache/apk/*

ADD docker-vars.ini /usr/local/etc/php/conf.d/
ADD www.conf /usr/local/etc/php-fpm.d/
