
FROM timescale/timescaledb-postgis:latest-pg12

MAINTAINER sahbi <sahbi.g@gmail.com>

RUN apk add --update \
    git \
    gcc \
    make \
    cmake \
    py-pip \
    musl-dev \
    && pip install pgxnclient \
    && rm -rf /var/cache/apk/*

RUN pgxn install h3

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-extensions.sh /docker-entrypoint-initdb.d/extensions.sh