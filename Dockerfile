FROM alpine:latest

RUN apk update && apk add caddy

WORKDIR "/opt/caddy/html"

EXPOSE 2015

VOLUME ["/opt/caddy/"]
ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["-conf", "/opt/caddy/Caddyfile", "-log", "stdout", "-agree"]
