envPath=./.env
current_date = $(shell date +%Y%m%d_%H%M%S)

.PHONY: build start
all: build start

build:
	docker-compose build
build_no_cache:
	docker compose build --no-cache
run:
	docker-compose up -d
up:
	docker-compose up -d
stop:
	docker compose down
down:
	docker compose down

start:
	docker compose up -d

rebuild: down build_no_cache run
	echo "rebuild"

