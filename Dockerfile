FROM caddy:builder-alpine AS builder
RUN xcaddy build \ 
    --with github.com/mholt/caddy-l4 \
    --with github.com/pberkel/caddy-storage-redis \
    --with github.com/caddyserver/replace-response \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/porech/caddy-maxmind-geolocation
FROM caddy:alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
