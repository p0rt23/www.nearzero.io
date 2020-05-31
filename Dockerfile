# FROM golang:1.14-alpine AS build

# RUN apk add --no-cache git

# RUN go get -u github.com/caddyserver/xcaddy/cmd/xcaddy
# RUN xcaddy build \
#     --with github.com/miekg/caddy-prometheus \
#     --output /usr/bin/caddy
# Test
# RUN /usr/bin/caddy -version
# RUN /usr/bin/caddy -plugins

FROM caddy:2-alpine

# COPY --from=build /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY site /www
