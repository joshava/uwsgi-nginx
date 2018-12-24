FROM python:alpine

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.7.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

RUN apk add --no-cache nginx

RUN apk add --no-cache build-base linux-headers pcre-dev && \
    pip install uwsgi && \
    apk del build-base linux-headers && \
    rm -rf /var/cache/apk/*

COPY root/ /

WORKDIR /app

ENTRYPOINT ["/init"]
