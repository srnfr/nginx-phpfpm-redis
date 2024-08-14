FROM richarvey/nginx-php-fpm:3.1.6
##cf https://gitlab.com/ric_harvey/nginx-php-fpm/-/blob/master/docs/versioning.md

## Redis included in parent image
#RUN apk add --no-cache --update \
#    autoconf git g++ make \
#    nfs-utils \
#    && apk add -U tzdata \
#    && rm -fr /var/cache/apk/*

ADD docker-vars.ini /usr/local/etc/php/conf.d/
ADD www.conf /usr/local/etc/php-fpm.d/

RUN rm -f /var/log/nginx/access.log /var/log/nginx/error.log

ENV TZ Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN cd /root \
   && wget https://github.com/DataDog/dd-trace-php/releases/latest/download/datadog-setup.php \
   && php datadog-setup.php --php-bin=all
