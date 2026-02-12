# Go Notes

A Dockerized notes app with a Go (Gin + GORM/pgx) API, Vue 3 + Vite + TS frontend, and PostgreSQL.

## Prerequisites

- Go 1.25+
- Node.js 20+ (or the version you use with Vite)
- Docker + Docker Compose (for container workflow)

## Local development

### Backend API

1) Copy the root env file and adjust as needed:

```bash
cp .env.example .env
```

2) Run the API:

```bash
cd backend
go run ./cmd/server
```

The API listens on `http://localhost:8080` by default.

### Frontend

1) Install deps and (optionally) copy the frontend env:

```bash
cd frontend/go-notes
npm install
cp .env.example .env
```

2) Start the dev server:

```bash
npm run dev
```

Set `VITE_API_BASE_URL` to `http://localhost:8080/api/v1` for local API access.

## Docker Compose

1) Copy env defaults:

```bash
cp .env.example .env
```

2) Build and run:

```bash
docker compose up --build
```

The stack exposes the app through the nginx proxy at `http://localhost`. To expose the API or the static web container directly, uncomment the `ports` sections in `docker-compose.yml` and adjust `VITE_API_BASE_URL` accordingly.

## Ports & env highlights

- `PORT` (API): 8080
- `WEB_PORT` (frontend dev): 4173
- `DB_PORT` (Postgres): 5432
- `VITE_API_BASE_URL`: front-end API base URL
- `CORS_ALLOWED_ORIGINS`: comma-separated origins allowed by the API for cross-origin requests

## Makefile shortcuts

- `make api-dev` – run the Go API locally
- `make api-test` – run backend tests
- `make web-dev` – run the Vue dev server
- `make web-build` – build the frontend
- `make docker-up` – build and run the stack
- `make docker-down` – stop and clean volumes

