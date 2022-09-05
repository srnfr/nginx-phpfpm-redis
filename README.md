# nginx-phpfpm-redis

Docker image based on nginx-php-fpm by richarvey, but with the following additions
- redis client PHP lib
- tzdata
- nfs client


This image was aimed to be used in large-scale Kubernetes-driven Wordpress elastic architecture.


Some notes on versions :
* Build 3.1.8 => FROM richarvey/nginx-php-fpm:1.5.1
* Build 3.1.7 => FROM richarvey/nginx-php-fpm:1.5.7
* Build 4.6.8 => FROM richarvey/nginx-php-fpm:1.6.8
* Build 4.7.4 => FROM richarvey/nginx-php-fpm:1.7.4
* Build 4.8.2 => FROM richarvey/nginx-php-fpm:1.8.2
* Build 4.9.1 => FROM richarvey/nginx-php-fpm:1.9.1
* Build 4.10.4 => FROM richarvey/nginx-php-fpm:1.10.4
* Build 5.0 => FROM richarvey/nginx-php-fpm:2.1.2
* Build 5.1 => Fixed comments that were raising snyk alerts
