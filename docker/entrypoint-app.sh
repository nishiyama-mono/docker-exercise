#!/bin/sh

# コンテナ起動時に走らせたい処理があったらここに書く
/usr/sbin/php-fpm7
/usr/sbin/nginx

tail -f /dev/null
