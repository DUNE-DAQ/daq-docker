FROM docker.io/library/alpine:latest

ENV REFRESHED_AT 2023-07-08

EXPOSE 8888

RUN apk add tinyproxy && apk cache clean

USER nobody:nobody
WORKDIR /tmp
CMD ["/usr/bin/tinyproxy", "-d"]
