FROM alpine:3.8

RUN apk add --no-cache ffmpeg

VOLUME ["/home/data"]

COPY run.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/run.sh"]
