#!/bin/sh

if [ ! -d /tool ];then
    mkdir /tool
fi

cd /tool

if [ -d /tool/satis ];then
    rm -rf /tool/satis
fi

if [ -d /tool/composer/ ];then
    rm -rf /tool/satis
fi

composer create-project composer/satis --stability=dev --keep-vcs

mv ./satis composer

path=$(cd `dirname $0`; pwd)

cat $path/satis.json > /tool/composer/satis.json

php bin/satis build satis.json public/

echo "配置nginx访问composer私有仓库"

#server {
#    listen       80;
#    server_name  composer.zhurp.xyz;
#
#    root   /data/composer/composer.zhurp.xyz/public/;
#
#    index  index.html index.htm;
#
#    error_page   500 502 503 504  /50x.html;
#    location = /50x.html {
#        root   html;
#        }
#    }
#}
