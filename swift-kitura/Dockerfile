FROM ubuntu:wily

MAINTAINER d-abe <abe@flup.jp>

ENV PATH /opt/swift/usr/bin:$PATH
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

RUN apt-get update \
    && apt-get install -q -y git wget clang dh-autoreconf pkg-config libkqueue0 libkqueue-dev libbsd-dev libblocksruntime-dev libicu-dev build-essential libhttp-parser-dev libcurl4-openssl-dev libhiredis-dev \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://swift.org/builds/development/ubuntu1510/swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a/swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a-ubuntu15.10.tar.gz \
    && tar zxf swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a-ubuntu15.10.tar.gz \
    && mkdir -p /opt/swift \
    && mv swift-DEVELOPMENT-SNAPSHOT-2016-02-08-a-ubuntu15.10/usr/ /opt/swift/ \
    && git clone -b opaque-pointer git://github.com/seabaylea/swift-corelibs-libdispatch \
    && cd swift-corelibs-libdispatch \
    && sh ./autogen.sh \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && wget https://raw.githubusercontent.com/IBM-Swift/Kitura/master/Sources/Modulemaps/module.modulemap -O /usr/local/include/dispatch/module.modulemap \
    && wget http://ftp.exim.org/pub/pcre/pcre2-10.20.tar.gz \
    && tar zxf pcre2-10.20.tar.gz \
    && cd pcre2-10.20 \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && git clone https://github.com/IBM-Swift/Kitura.git \
    && cd Kitura \
    && swift build ; \
    make

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
