FROM golang:1.14-alpine AS golang-build

RUN apk add --no-cache git

COPY caddy /caddy
WORKDIR /caddy

RUN go mod init caddy && \
    go get github.com/caddyserver/caddy@v1.0.5 && \
    go build

# Test
RUN ./caddy -version
RUN ./caddy -plugins

FROM alpine:latest AS node-build
RUN apk update && \
    apk add build-base && \
    apk add python3 && \
    apk add nodejs && \
    apk add npm
RUN npm install -g @vue/cli

COPY site /site
WORKDIR /site
RUN npm install && npm run build

FROM alpine:latest

COPY --from=golang-build /caddy/caddy /usr/bin/caddy
COPY --from=node-build /site/dist /www
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 2015
EXPOSE 9180

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["-conf", "/etc/caddy/Caddyfile", "-log", "stdout", "-agree"]
