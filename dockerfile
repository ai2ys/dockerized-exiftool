FROM alpine:3.15.3

WORKDIR /

RUN apk update && apk add --no-cache \
    exiftool \
    curl \
  && rm -rf /var/cache/apk/*

WORKDIR /home/$USER
RUN mkdir -p ./scripts
COPY ./scripts/* ./scripts/
WORKDIR /home/$USER/scripts

ENTRYPOINT ["/bin/sh", "./exiftool.sh"]