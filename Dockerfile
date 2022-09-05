FROM richarvey/nginx-php-fpm:2.1.2

##cf https://gitlab.com/ric_harvey/nginx-php-fpm/-/blob/master/docs/versioning.md

RUN apk add --no-cache --update \
    redis \
##  php7-redis \
    autoconf git g++ make \
    nfs-utils \
    && apk add -U tzdata \
    && rm -fr /var/cache/apk/*
## Deja installe RUN pecl install redis 
## Deja installe  RUN docker-php-ext-enable redis 

ADD docker-vars.ini /usr/local/etc/php/conf.d/
ADD www.conf /usr/local/etc/php-fpm.d/

RUN rm -f /var/log/nginx/access.log /var/log/nginx/error.log

ENV TZ Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

##RUN apk add --no-cache ca-certificates && update-ca-certificates
##ADD https://get.aquasec.com/microscanner .
##RUN chmod +x microscanner
##ARG token
##RUN ./microscanner ${token} --continue-on-failure

##Debug
##ADD t.php /var/www/html/
ADD /ver.txt /etc/

ADD VERSION .
