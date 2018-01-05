FROM richarvey/nginx-php-fpm:latest

RUN apk update \
  && apk add redis \
##  && apk add php7-redis \
  && apk add autoconf git g++ make \
  && rm /var/cache/apk/*

RUN pecl install redis && docker-php-ext-enable redis

ADD docker-vars.ini /usr/local/etc/php/conf.d/
ADD www.conf /usr/local/etc/php-fpm.d/

##Debug
##ADD t.php /var/www/html/
ADD /ver.txt /etc/
