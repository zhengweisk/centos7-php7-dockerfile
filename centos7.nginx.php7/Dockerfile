FROM daocloud.io/library/centos:7
MAINTAINER sklinux <sklinux@qq.com>
#step1

RUN yum -y install epel-release.noarch && yum clean all && yum -y groupinstall "Development tools" && yum clean all &&  yum -y install libaio-devel.x86_64 libaio.x86_64 libxml2 libxml2-devel ftp bzip2-devel bzip2 curl libcurl-devel openssl-devel openssl libjpeg libjpeg-devel libpng-devel libpng libXpm  libXpm-devel freetype-devel freetype libc-client-devel libmcrypt libmcrypt-devel mhash-devel mysql-devel mysql mysql-server libc-client-devel pcre-devel.x86_64 pcre.x86_64 libXpm-devel.x86_64 libXpm.x86_64 mcrypt.x86_64 && yum clean all

#RUN yum -y install libmcrypt.x86_64 
#RUN yum -y install libmcrypt-devel

RUN ln -s  /usr/lib64/libXpm.so*   /usr/lib/
RUN ln -s /usr/lib64/libc-client.so /usr/lib/libc-client.so
RUN mkdir /opt/src
RUN mkdir /opt/nginx/conf -p
RUN mkdir /opt/nginx/conf/vhosts -p
RUN mkdir /data/wwwroot -p
COPY nginx-1.15.0.tar.gz /opt/src/
COPY php-7.2.7.tar.gz /opt/src/
#COPY memcache-2.2.7.tgz /opt/src
#COPY xcache-1.3.2.tar.gz /opt/src
COPY nginx.conf /opt/nginx/conf
COPY www.conf /opt/nginx/conf/vhosts
COPY php-fpm.conf /opt/php7/etc/php-fpm.conf
COPY index.php /data/wwwroot/index.php
COPY php.ini /opt/php7/lib/
#step2
WORKDIR /opt/src
RUN tar xzf  nginx-1.15.0.tar.gz && cd nginx-1.15.0 && ./configure --prefix=/opt/nginx && make && make install && rm -rf nginx-1.15.0
WORKDIR /opt/src
#php5.3.20
WORKDIR /opt/src
RUN tar xzf php-7.2.7.tar.gz && cd php-7.2.7 && export MYSQL_LIB_DIR=/usr/lib64/mysql && ./configure --prefix=/opt/php7 --with-mysql --enable-mysqlnd --with-openssl --enable-bcmath --with-zlib --enable-bcmath --with-bz2 --enable-calendar --with-curl --with-libxml-dir --enable-exif --with-pcre-dir --enable-ftp --with-openssl-dir --with-gd --with-jpeg-dir --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir --enable-gd-native-ttf --with-gettext --with-imap --enable-mbstring --with-mcrypt --with-mhash --with-zlib-dir --enable-shmop --enable-soap --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --enable-zip --with-kerberos --with-imap-ssl --enable-fpm --with-pdo-mysql && make && make install 

CMD /opt/php7/sbin/php-fpm && /opt/nginx/sbin/nginx && bash
