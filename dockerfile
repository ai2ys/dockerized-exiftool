FROM alpine:3.15.3

WORKDIR /

RUN apk update && apk add --no-cache \
    exiftool \
    curl \
  && rm -rf /var/cache/apk/*

ENTRYPOINT ["/bin/sh", "-c", "exiftool $@ -"]