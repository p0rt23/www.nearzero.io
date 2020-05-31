FROM caddy:2-builder AS builder

RUN caddy-builder \
    github.com/miekg/caddy-prometheus

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
COPY Caddyfile /etc/caddy/Caddyfile
COPY site /usr/share/caddy
