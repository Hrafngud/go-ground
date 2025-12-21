API_DIR=backend
WEB_DIR=frontend/go-notes
COMPOSE?=docker compose

.PHONY: api-dev api-test web-dev web-build docker-up docker-down

api-dev:
	cd $(API_DIR) && go run ./cmd/server

api-test:
	cd $(API_DIR) && go test ./...

web-dev:
	cd $(WEB_DIR) && npm run dev

web-build:
	cd $(WEB_DIR) && npm run build

docker-up:
	$(COMPOSE) up --build

docker-down:
	$(COMPOSE) down -v
