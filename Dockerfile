## Build 3.1.8 => FROM richarvey/nginx-php-fpm:1.5.1
## Build 3.1.7 => FROM richarvey/nginx-php-fpm:1.5.7
## FROM richarvey/nginx-php-fpm:latest
FROM richarvey/nginx-php-fpm:1.8.2

RUN apk add --no-cache --update \
    redis \
##  php7-redis \
    autoconf git g++ make \
    nfs-utils \
  && apk add -U tzdata \
  && pecl install redis \
  && docker-php-ext-enable redis \
  && rm -fr /var/cache/apk/*

ADD docker-vars.ini /usr/local/etc/php/conf.d/
ADD www.conf /usr/local/etc/php-fpm.d/

RUN rm -f /var/log/nginx/access.log
RUN rm -f /var/log/nginx/error.log

ENV TZ Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

#RUN apk add --no-cache ca-certificates && update-ca-certificates
#ADD https://get.aquasec.com/microscanner .
#RUN chmod +x microscanner
#ARG token
#RUN ./microscanner ${token} --continue-on-failure

##Debug
##ADD t.php /var/www/html/
ADD /ver.txt /etc/

ADD VERSION .
