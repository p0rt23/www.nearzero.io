FROM alpine:latest

RUN apk update && apk add caddy

COPY "./caddy/*" "/opt/caddy/"

WORKDIR "/opt/caddy/html"

EXPOSE 2015

VOLUME ["/opt/caddy/html/minecraft"]
ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["-conf", "/opt/caddy/Caddyfile", "-log", "stdout", "-agree"]
