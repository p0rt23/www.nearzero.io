FROM golang:1.14-alpine AS build

RUN apk add --no-cache git

COPY caddy /caddy
WORKDIR /caddy

RUN go mod init caddy && \
    go get github.com/caddyserver/caddy@v1.0.5 && \
    go build

# Test
RUN ./caddy -version
RUN ./caddy -plugins

FROM alpine:latest

COPY --from=build /caddy/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY site /www

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["-conf", "/etc/caddy/Caddyfile", "-log", "stdout", "-agree"]
