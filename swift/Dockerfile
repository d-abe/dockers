FROM ubuntu:wily

# Swiftインストール
RUN apt-get update
RUN apt-get install -qy git lsb-release curl libpython-dev libxml2-dev clang libicu-dev build-essential
RUN git clone https://github.com/kylef/swiftenv.git /usr/local/swiftenv
ENV SWIFTENV_ROOT /usr/local/swiftenv
ENV PATH $SWIFTENV_ROOT/bin:$SWIFTENV_ROOT/shims:$PATH

RUN swiftenv install DEVELOPMENT-SNAPSHOT-2016-04-12-a

# npm, gulp関係を入れる
RUN apt-get install -qy nodejs npm
RUN rm -rf /var/lib/apt/lists/* \
    && ln -s `which nodejs` /usr/local/bin/node
RUN npm install -g gulp
RUN mkdir /work \
    && cd /work \
    && npm install gulp gulp-process gulp-watch

# スクリプトのコピー
COPY gulpfile.js /work/gulpfile.js
COPY build.sh /work/build.sh
COPY dev.sh /dev.sh

RUN chmod +x /work/build.sh \
  && chmod +x /dev.sh

WORKDIR /src

CMD ["/dev.sh"]
