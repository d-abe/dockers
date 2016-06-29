FROM php:7-apache

WORKDIR /root
RUN apt-get update && apt-get install -y libpq-dev git && docker-php-ext-install pdo pdo_pgsql && \
    apt-get install -y tesseract-ocr && \
    git clone https://github.com/phalcon/zephir && \
    cd zephir && ./install-nosudo && \
    cd .. && \
    git clone http://github.com/phalcon/cphalcon && \
    cd cphalcon && \
    git checkout 2.1.x && \
    ~/bin/zephir build --backend=ZendEngine3 && \
    cp ext/modules/phalcon.so /usr/local/lib/php/extensions/no-debug-non-zts-20151012/ && \
    a2enmod rewrite && \
    echo 'extension=phalcon.so' > /usr/local/etc/php/conf.d/phalcon.ini && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/man/?? && \
    rm -rf /usr/share/man/??_* && \
    cd /root && rm -rf cphalcon && rm -rf zephir
RUN  docker-php-ext-install zip
WORKDIR /var/www/html