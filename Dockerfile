
FROM timescale/timescaledb-postgis:1.7.0-pg12

MAINTAINER sahbi <sahbi.g@gmail.com>

RUN apk add --update \
    cmake \
    make \
    gcc clang llvm \
    libtool \
    musl-dev \
    git \
    py-pip \
    && pip install pgxnclient \
    && rm -rf /var/cache/apk/*

RUN pgxn install h3

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-extensions.sh /docker-entrypoint-initdb.d/extensions.sh