FROM ubuntu:wily

MAINTAINER d-abe <abe@flup.jp>

ENV PATH /opt/swift/usr/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

WORKDIR /root

RUN apt-get update \
    && apt-get install -q -y nodejs npm git wget clang dh-autoreconf pkg-config libkqueue0 libkqueue-dev libbsd-dev libblocksruntime-dev libicu-dev build-essential libhttp-parser-dev libcurl4-openssl-dev libhiredis-dev \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s `which nodejs` /usr/local/bin/node \
    && wget https://swift.org/builds/development/ubuntu1510/swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a/swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a-ubuntu15.10.tar.gz \
    && tar zxf swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a-ubuntu15.10.tar.gz \
    && mkdir -p /opt/swift \
    && mv swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a-ubuntu15.10/usr/ /opt/swift/ \
#    && git clone -b opaque-pointer git://github.com/seabaylea/swift-corelibs-libdispatch \
    && git clone https://github.com/apple/swift-corelibs-libdispatch.git \
    && cd swift-corelibs-libdispatch \
    && git submodule init && git submodule update \
    && sh ./autogen.sh \
    && ./configure --with-swift-toolchain=/opt/swift/usr --prefix=/opt/swift/usr \
    && make \
    && make install \
    && cd .. \
#    && wget https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Sources/Modulemaps/module.modulemap -O /usr/local/include/dispatch/module.modulemap \
    && wget http://ftp.exim.org/pub/pcre/pcre2-10.20.tar.gz \
    && tar zxf pcre2-10.20.tar.gz \
    && cd pcre2-10.20 \
    && ./configure \
    && make \
    && make install \
    && npm install -g gulp \
    && mkdir /work \
    && cd /work \
    && npm install gulp gulp-process

COPY gulpfile.js /work/gulpfile.js
COPY build.sh /work/build.sh
COPY Makefile /work/Makefile

RUN chmod +x /work/build.sh


WORKDIR /src

COPY dev.sh /dev.sh
RUN chmod +x /dev.sh
CMD ["/dev.sh"]
