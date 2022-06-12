## Environment PHP 

FROM php:7.4-cli AS environment-php

WORKDIR /usr/environment-php/

COPY . /usr/environment-php/

# RUN composer install

EXPOSE 8080

CMD [ "php", "-S", "0.0.0.0:8080" ]