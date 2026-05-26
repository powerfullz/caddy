.PHONY: up down reload validate logs

up:
	docker compose up -d

down:
	docker compose down

validate:
	docker compose exec caddy caddy validate --config /etc/caddy/Caddyfile

reload: validate
	docker compose exec caddy caddy reload --config /etc/caddy/Caddyfile

logs:
	docker compose logs -f caddy
