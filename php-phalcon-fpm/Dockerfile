FROM ubuntu:14.04

run apt-get update && \
    apt-get install -y -q software-properties-common && \
    apt-add-repository ppa:phalcon/stable && \
    apt-get update && \
    apt-get install -y -q php5-common php5-cli php5-fpm php5-dev php5-pgsql php5-gd php5-curl php-pear php5-imagick php5-mcrypt php5-memcached php5-phalcon libpcre3-dev curl && \
    php5enmod mcrypt && \
    php5enmod phalcon && \
    sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Tokyo/g' /etc/php5/fpm/php.ini && \
    sed -i 's/\;date\.timezone\ \=/date\.timezone\ \=\ Asia\/Tokyo/g' /etc/php5/cli/php.ini && \
    sed -i "s/expose_php=.*/expose_php=Off/" /etc/php5/fpm/php.ini && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php5/fpm/php.ini && \
    sed -i -e "s/;catch_workers_output\s*=\s*yes/catch_workers_output = yes/g" /etc/php5/fpm/pool.d/www.conf && \
    echo "php_admin_value[display_errors] = 'stderr'" >> /etc/php5/fpm/pool.d/www.conf && \
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 20M/" /etc/php5/fpm/php.ini && \
    sed -i "s/post_max_size = 2M/post_max_size = 20M/" /etc/php5/fpm/php.ini && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/php5","/var/run"]

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php5-fpm", "-F"]