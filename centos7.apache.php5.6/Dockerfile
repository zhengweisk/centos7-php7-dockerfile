FROM daocloud.io/library/centos:7
MAINTAINER sklinux <sklinux@qq.com>
#step1

RUN yum -y install epel-release.noarch && yum clean all && yum -y groupinstall "Development tools" && yum clean all &&  yum -y install libaio-devel.x86_64 libaio.x86_64 libxml2 libxml2-devel ftp bzip2-devel bzip2 curl libcurl-devel openssl-devel openssl libjpeg libjpeg-devel libpng-devel libpng libXpm  libXpm-devel freetype-devel freetype libc-client-devel libmcrypt libmcrypt-devel mhash-devel mysql-devel mysql mysql-server libc-client-devel pcre-devel.x86_64 pcre.x86_64 libXpm-devel.x86_64 libXpm.x86_64 mcrypt.x86_64  && yum clean all

#RUN yum -y install libmcrypt.x86_64 
#RUN yum -y install libmcrypt-devel

RUN ln -s  /usr/lib64/libXpm.so*   /usr/lib/
RUN ln -s /usr/lib64/libc-client.so /usr/lib/libc-client.so
RUN mkdir /opt/src
RUN mkdir /data/wwwroot -p
RUN mkdir /opt/http2
COPY httpd-2.4.9.tar.bz2 /opt/src/
COPY apr-1.5.2.tar.bz2 /opt/src/
COPY apr-util-1.5.4.tar.bz2 /opt/src/

COPY php-5.6.30.tar.bz2 /opt/src/
COPY index.php /data/wwwroot/index.php
COPY php.ini /opt/php56/lib/
COPY httpd.conf /opt/http2/conf/httpd.conf
COPY php-fpm.conf /opt/php56/etc/php-fpm.conf
#step2
WORKDIR /opt/src

RUN ls -lh /opt/src
RUN tar xjf apr-1.5.2.tar.bz2 && cd apr-1.5.2 && ./configure --prefix=/opt/apr && make && make install

#apu
WORKDIR /opt/src
RUN tar xjf apr-util-1.5.4.tar.bz2 && cd apr-util-1.5.4 && ./configure --prefix=/opt/apru --with-apr=/opt/apr && make && make install
#apr apr-u

#apache
#http2
WORKDIR /opt/src
RUN tar xjf httpd-2.4.9.tar.bz2 && cd httpd-2.4.9 &&  "./configure" "--prefix=/opt/http2" "--enable-expires" "--enable-rewrite" "--enable-so" "--with-apr=/opt/apr/" "--with-apr-util=/opt/apru/" && make && make install

WORKDIR /opt/src
#php5.6
WORKDIR /opt/src
RUN tar xjf php-5.6.30.tar.bz2 && cd php-5.6.30 && export MYSQL_LIB_DIR=/usr/lib64/mysql && ./configure --prefix=/opt/php56 --with-mysql --enable-mysqlnd --with-openssl --enable-bcmath --with-zlib --enable-bcmath --with-bz2 --enable-calendar --with-curl --with-libxml-dir --enable-exif --with-pcre-dir --enable-ftp --with-openssl-dir --with-gd --with-jpeg-dir --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir --enable-gd-native-ttf --with-gettext --with-imap --enable-mbstring --with-mcrypt --with-mhash --with-zlib-dir --enable-shmop --enable-soap --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-wddx --enable-zip --with-kerberos --with-imap-ssl --enable-fpm --with-pdo-mysql && make && make install && rm -rf ./php-5.6.30

CMD /opt/php56/sbin/php-fpm & /opt/http2/bin/apachectl start & bash
