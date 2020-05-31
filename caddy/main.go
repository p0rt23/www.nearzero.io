package main

import (
    "github.com/caddyserver/caddy/caddy/caddymain"

    // plug in Caddy modules here
    _ "github.com/miekg/caddy-prometheus"
)

func main() {
    caddymain.Run()
}
