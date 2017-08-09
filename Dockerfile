FROM alpine:edge

## package repositories
RUN mkdir -p /usr/local/sbin \
    && echo http://nl.alpinelinux.org/alpine/edge/main | tee /etc/apk/repositories \
    && echo http://nl.alpinelinux.org/alpine/edge/testing | tee -a /etc/apk/repositories \
    && echo http://nl.alpinelinux.org/alpine/edge/community | tee -a /etc/apk/repositories \
    && apk upgrade

RUN apk --update add wget \
        curl \
        git \
        grep \
        tzdata

### PHP7
RUN apk --update add \
        php7 \
        php7-intl \
        php7-openssl \
        php7-dba \
        php7-sqlite3 \
        php7-pear \
        php7-tokenizer \
        php7-phpdbg \
        php7-litespeed \
        php7-gmp \
        php7-pdo_mysql \
        php7-pcntl \
        php7-common \
        php7-xsl \
        php7-fpm \
        php7-imagick \
        php7-mysqlnd \
        php7-enchant \
        php7-pspell \
        php7-redis \
        php7-snmp \
        php7-fileinfo \
        php7-mbstring \
        php7-dev \
        php7-pear-mail_mime \
        php7-xmlrpc \
        php7-xmlreader \
        php7-pear-mdb2_driver_mysql \
        php7-pdo_sqlite \
        php7-pear-auth_sasl \
        php7-exif \
        php7-recode \
        php7-opcache \
        php7-ldap \
        php7-posix \
        php7-pear-net_socket \
        php7-session \
        php7-gd \
        php7-gettext \
        php7-mailparse \
        php7-json \
        php7-xml \
        php7-iconv \
        php7-sysvshm \
        php7-curl \
        php7-shmop \
        php7-odbc \
        php7-phar \
        php7-pdo_pgsql \
        php7-imap \
        php7-pear-mdb2_driver_pgsql \
        php7-pdo_dblib \
        php7-pgsql \
        php7-pdo_odbc \
        php7-xdebug \
        php7-zip \
        php7-cgi \
        php7-ctype \
        php7-amqp \
        php7-mcrypt \
        php7-wddx \
        php7-pear-net_smtp \
        php7-bcmath \
        php7-calendar \
        php7-tidy \
        php7-dom \
        php7-sockets \
        php7-zmq \
        php7-memcached \
        php7-soap \
        php7-apcu \
        php7-sysvmsg \
        php7-zlib \
        php7-imagick-dev \
        php7-embed \
        php7-ftp \
        php7-sysvsem \
        php7-pear-net_idna2 \
        php7-pdo \
        php7-pear-auth_sasl \
        php7-bz2 \
        php7-mysqli \
        php7-simplexml \
        php7-xmlwriter \
        && rm /var/cache/apk/*

### composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer global require hirak/prestissimo


### nginx
RUN apk --update add nginx

### misc
RUN mkdir -p /etc/nginx \
    && mkdir -p /run/nginx \
    && mkdir -p /run/php \
    && mkdir -p /var/run/php-fpm \
    && mkdir -p /var/log/supervisor \
    && mkdir -p /etc/supervisor.d

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

CMD ["/bin/sh"]
